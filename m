Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B3316190
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587436; cv=none; b=BZaiUJ2qY9UZ1b0x0GLkoE6gqAUE39/Ggik/ul2/IlSac7ArOt4Xn0QR+Iug3Cs/5OH1aYc162AHOIyDpbC/EUO7ivjqI7dN4VPXBKyee3DVCtA1Wwb0vdcfeK/8ExxZyaGffOrE0E+CqbX5Lph4rtkf8z9TfZrpKrdDCc/PeOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587436; c=relaxed/simple;
	bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceCP7oZcjc6vrW/n0FDQRql5kHdcl7uSqfwZ3aIDlz0btXQqfQWtpGDLuSetgCuuq6tnTJt2Nufvz7XSvxDuIaNQpUdc4V5rjFBBpmHr7WetnYQDd9Dec3ysetGVEKnTXdY6DCxs+Yv6gpXF+pxgUY9OWvnTN4oWUdkjNyuzQ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPc5udlm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPc5udlm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32A6C116B1
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761587435;
	bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=hPc5udlmqmgZFtCyuwcvoyF0vHryNuhDjCkhPV1vzvSz+5k+2XSb1nJqPEqXrloqQ
	 G2H/VFN54GYkbFKD79Mkp4StJfyREDjFMCUtEi0BmhHc1tEngsDtuoVi9a93NRHIOl
	 NNNXLuENNF113z078ll+QdiiyPQNz/hEam9FePbsg6URFCREKBL2creHYabr8WuzZO
	 I8jgr50Bh3OhHcEczSO+P9JFyWX1R07GUOI2A7Ijm7kf5KXWTkYuSxmiNjVn1/dVjX
	 l9hsHViKHnowTnALtdy7v4H7Lxl++R8UNr6rb+V6Azqe6gGJVXlo5FXS90iyPKT+BB
	 zaenp7vq3KRzg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-376466f1280so75391211fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 10:50:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHbFLwIF+7sVCtQ+KhN7Nvx+hEUJMajm13G2E4IhBI0Ye7edog5YPFkxDkw1yqgD2ElrYHNYpKNjUDJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPae2fMK2X/EFsjdP1cJf+tJB8FNvGUZpPKlve6LFgJQLnYKXY
	a37xtNqQyOmPNQyo5cuwTH/rogqubWfK/FsPjkdOVGLdQEYWea0NimU86Ux7U4gwAPNkeQjJPsH
	cqfORCfuzTPQvMXZnbJ1Wl9ToohrmR0w=
X-Google-Smtp-Source: AGHT+IEpGNxxA7VDQv+o8rVV0qXU7mdmIaNInPaLQFSEX+7AAmZL6Vjak813oddK9k7tZDInWi03lBY0pbQ9WFw1kig=
X-Received: by 2002:a2e:9f10:0:b0:378:ddbe:2d93 with SMTP id
 38308e7fff4ca-379077813a2mr1483941fa.40.1761587434294; Mon, 27 Oct 2025
 10:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-20-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-20-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:50:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mHaxFAZ_OtPoOfoKbV8x7EFCAmhiq7D0NY0zdRZ627w@mail.gmail.com>
X-Gm-Features: AWmQ_blUGjau3HSQfAh8dWnb5YOCLFjTOutdiwr-yTqdCVXgYeAKGne6ORl8okc
Message-ID: <CAGb2v67mHaxFAZ_OtPoOfoKbV8x7EFCAmhiq7D0NY0zdRZ627w@mail.gmail.com>
Subject: Re: [PATCH 19/30] drm/sun4i: vi_scaler: use layer instead of mixer
 for args
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Layer related peripherals should take layer struct as a input. This
> looks cleaner and also necessary for proper DE33 support later.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
