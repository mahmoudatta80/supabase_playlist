import 'package:chat_app/features/profile/logic/fetch_profile_cubit/fetch_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/fetch_profile_cubit/fetch_profile_states.dart';
import 'widgets/profile_body_loading_section.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: BlocBuilder<FetchProfileCubit, FetchProfileStates>(
          builder: (context, state) {
            if (state is FetchProfileSuccess) {
              return ProfileViewBody(
                userModel: state.userModel,
              );
            } else if (state is FetchProfileFailure) {
              return _buildProfileBodyErrorSection(
                errorMessage: state.errorMessage,
                context: context,
              );
            } else {
              return const ProfileBodyLoadingSection();
            }
          },
        ),
      ),
    );
  }

  Widget _buildProfileBodyErrorSection({
    required String errorMessage,
    required BuildContext context,
  }) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Text(errorMessage),
        const SizedBox(height: 10),
        IconButton(
          onPressed: () {
            context.read<FetchProfileCubit>().fetchProfile();
          },
          icon: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
