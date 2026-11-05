Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892515;
	b=YY0S3WSRC6wa8E79Q1Kcn1ER3OhL8fu1xRmqfJqK4lQV79Rh+8Qst3Pab7tdoRpOnlUm
	 3TkEQvqX0geKi1f1MEob+2xw4g2XrZVaCAR/k7YJVBSgj3gREyyuGqzYDLXASTvmX7RFw
	 rLEYcyCGqKUrARkcjFKFvaoJqz3Enji+t0RGBbXKVP7nJOCurKVNl9VOKTuTOKdJ8mC6P
	 15ZbkQxZYpYwXKtYkC3wKe3hFHkJ1Ug1WWIzybM+OiGuAQeiwyx4e80G89i2ZERXWG4wt
	 PkQ6y/s6T2TvCRQalQsv+zfACqwZ4GrGhtp2mY1mMlcAzt7DXaGom1PS4H13DgnfN+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892515;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J01yUeie/Wz6lwSQ5EJbgkIcdFABXtjhc6Kmpd+Ka/Q=;
	b=pzRGCVE2HIuvTRLN+5h0HNqqNyuxALqddoWu71waT8yjVymLYCaujfBAySZ8mcSb+/lR
	 +3fRi8Aozkufr1hwoH8psfO0p4hczfEthap8A/Y9Gv6GxTiT2uz4RlFFDvIsDR7c1BFP8
	 5gdiJKtYXYyrIezwt14DW+u99dlVFDRMz2eNI7jbyCSrf9yGYg8xcwzHA+bv5I7AJcJor
	 YaYMw6ShUouaH/IGiW5tIg5xaUM/ATJxq3CUPaFHtr8xL0hamJBV2eVR+yGgDYRvAfeKq
	 vCjYKPgWf2rpm7f76PePL7IOeusVKJVuRiP2U96RPv/zaY+WLFm//wdP3YseDwcRgcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYFSWwTo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A96606A31B
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYFSWwTo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89D11F000C1
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892514;
	bh=J01yUeie/Wz6lwSQ5EJbgkIcdFABXtjhc6Kmpd+Ka/Q=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=YYFSWwToJ3KiiY27Jw7ohGca7U2+WygyGJvvI+ZrdEmZrTC4RffjRY6GPKmPjYNEs
	 h8/J6GvRtBSCoEIzSwUhKB8gdOBxNLRvI+y0cLD+ccgwfHksKGpFHn2uR1uCyyyAhc
	 lMB2VyFO2cPRFqy3m94OztpOXkQk5clgfmDBnObsBWIRuzSSdUu1rUDwlcWxdKY3O6
	 4WcPOSAILPBlMHHPEIRodWwakPS9agTe6UcpZIG4RosdciHAwTPd2vVVyMYGddboFy
	 m+7W4E84gUE0QJ0fi5xh2hQTWRSLmGbuhgq4am0ZfibATKYOxBV9EUHzot/nsvcCkC
	 r6wmqnvG6wsfA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab46699a09so15659731fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 07:28:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxdhGEKmyuuK9bIOXVnL+KJXXk1rbiB0GEZs4i5WrFKAL200sG9nXAr243PT9ejPaCvi1XOvWXD7dI7rg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8r8fjOfBkGtk3oScg8JIKVpSYtkfkhe0XYF8EsQiS/bbFR9O2o
	cY7012p3RKntegRtdU//deYz7qc/2GSFpSgZy/KlnIPhh8NHMefJ0m7rXpsTSb6TqgIQ2CaBE1t
	5PDQAX/o1l2glOcu0qZdfBAlL9Ug0gFM=
X-Received: by 2002:a2e:a555:0:b0:3ac:97e4:4987 with SMTP id
 38308e7fff4ca-3acb7a8dc6emr50550791fa.7.1793892513406; Thu, 05 Nov 2026
 07:28:33 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org> <20261105-drm-no-more-config-reset-v1-47-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-47-763560c2cc3f@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 5 Nov 2026 23:28:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67KjNdsGfF_1hZvcdk=zf4sBOKcvLavQLNFnkm4Lars9Q@mail.gmail.com>
X-Gm-Features: AclHuK_hUvE7zDFJlkCFJyVytnDgzw5dN2efT3tqRgnsKVs4MBHR4II7NBtUwwg
Message-ID: <CAGb2v67KjNdsGfF_1hZvcdk=zf4sBOKcvLavQLNFnkm4Lars9Q@mail.gmail.com>
Subject: Re: [PATCH 47/83] drm/sun4i: Switch to drm_mode_config_create_initial_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:10=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
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
