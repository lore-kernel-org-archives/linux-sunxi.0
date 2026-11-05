Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893062;
	b=U/pJ5AJqoVzelBhYbuYi4YPUuSdSQhCn6ZIifnfZ3im7NTdWckKxFHAjGGpT00q6uFnf
	 MfT4UOx0/h2YwAk7+k1fQtBrO/rMVzNueoe9ZDY/nLnhnFyQomUEzi+9Gei7b9lyas98o
	 GeODFimsnxuWVP6BO+yWauGv4yDUhwmHRWPSNxENPTSalW8Pvo8SdLiFnOKGbQog8Kfpw
	 egI3j3607EaSCY5kNgaLF+GicCrIPg0Udd76Hkv6RI7CVmRxAhC2VFPs3mzWqna2Uoj4P
	 SGmzZ6XT1Ew5R6IOvyLdGOcJLkg6E8hMElViB8GCQ6KvRRHh8vNPGPC8ZS28SHkM3vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893062;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gTh04bL+xtfTM77EiEDyxaXv+7mzpg3XtmoRfbXmXTE=;
	b=Q66y0/dKm6QcVLc0y1YOAS6vAWElg+YxrWDQCW6ATKBqbp0yNgnnwASyorw6pHbtfQWm
	 7UaeRvKOnY8JzDfS9jBCWaDxwtMw8zr/dKuHiDFD9VkDWGh3MJoQjAPWcMpfy6FrpRFrM
	 Efl61xtVMB8Ha59yVOlTpRtYFRTlY0IFSJ7p62fcPuUJCIFpHuYO4vMFLdklamE8t5pLx
	 Ny38VpveGa7q0DiaHJ3xACIEd598qg0I0RM06tbA6q+hk7c7NJjk9F1P++xkRxTC6gbw6
	 YA8rH5MUoyhabw7foTY1So5ZUzueh4Y9/KpgLRCq2KSjALJpwl81T+jDOrKFQN8SytQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Udth0uC0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28594606A330
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Udth0uC0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6921F00A18
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 15:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893061;
	bh=gTh04bL+xtfTM77EiEDyxaXv+7mzpg3XtmoRfbXmXTE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Udth0uC0Gaapc0S3TCcUzHih3F3+sV1SPcONOctrXUB3qu7SB3VuHA/EDg9CsjLQL
	 YMTlIzgNnpo5CxWxTzTAPV/vfCj15wg73gOcqBDcLK+wHlstT60dHim5B8D4bBOMbv
	 06yNBrjduzKKQGehEkXG/fEBG8L4XzY8hD+8vQdNjyRbHAy2BKje8ghtQCV0u5B6Aj
	 h9uLUb0zYH4jhjoGfe2O+s5K8fAAXfUfhCNJ0I59SgIqxNebOnfbXQEhSBPhXwvE+P
	 ozIZ+silwerSfBTiO/0Z+H5eMzh6dAQDWJ+NUjvloD8kvNNT1IshLgP7u3zJHP2SWt
	 wn9zRt93n0HBA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso24298201fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 07:37:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxGzkjuEd0VnH1ah6SVNXyq8CXKMbSAVIxmXBCjCJHePh2tPEOj2i1wcbewhmCtK515pgOlPijBDVN0zg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9w+fJjZA0+GYNltPVKwkdw8DTOqR8BRBa+3fK0PprJhf1PKlvr
	fImIpXMIhPZSnyyGz555CK7eBapWfaH76Pl05VKEKMfsifwpdKAnYsgKgwDjVRs4R0fYnoXaw2r
	dQ55L5ckJ2UeBPqG8+yQoDDpaS1mTFkE=
X-Received: by 2002:a2e:b896:0:b0:3ac:99c3:7f82 with SMTP id
 38308e7fff4ca-3acb7a65d16mr45343871fa.5.1793893060157; Thu, 05 Nov 2026
 07:37:40 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org> <20261105-drm-no-more-config-reset-v1-47-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-47-1f58d1e33380@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 5 Nov 2026 23:37:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v64E811JwNT9=eE4DNycrfaV8=U8B5KFOZY-uACVijAOKw@mail.gmail.com>
X-Gm-Features: AclHuK_jjhDmTWb9gl1wRXLLCbElNt6bPu9l2mBBzKY1pQfiuv-NjU8F7dbiWi4
Message-ID: <CAGb2v64E811JwNT9=eE4DNycrfaV8=U8B5KFOZY-uACVijAOKw@mail.gmail.com>
Subject: Re: [PATCH RESEND 47/83] drm/sun4i: Switch to drm_mode_config_create_initial_state
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:33=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> drm_mode_config_reset() has a dual role: it creates the initial KMS
> state at probe time, and resets hardware and software state during
> suspend/resume cycles.
>
> Since the two roles need different behaviors (notably for objects like
> drm_private_obj that must persist across suspend/resume),
> drm_mode_config_create_initial_state() was introduced to handle only
> the initial state creation at probe time.
>
> Switch to drm_mode_config_create_initial_state().
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
