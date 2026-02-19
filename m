Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78301DC198
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Feb 2026 03:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771473115; cv=none; b=Qmrx7Fcupnp/gnKSc+CKPlNKhQjwG6Fm8IianxADsjlSBqWzkZnnpRVuMl+TTkA1SUJgLkApflIOshtSUUF5PbAcC57TlJN2rWQmVcDteFoqmzibTMNrgw5dGV0ahtZENJRntiyqdOZEweYfVFxOoinTSpEN+jkoqwZmGVl+tUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771473115; c=relaxed/simple;
	bh=X46UpLW2j+eyZ6ykAjkS0HlxNYklVA+kQjtmNdaEaUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4TJ3bKP19HAN5dubwYcXPSG8U3RkgNtKj52PAevPESrH1e0Pk+rd1+dpJcU+aPTeFh4XNJLZ1+I1G6NNfRNuvDh5HwvdGPlwLg1aluSzDIssPiyU0p+TaiHcdxsLYOs7UWoz7r6FzSYdbRrBHPvGjOCKT/GO63ORKITduexXzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=La4X65W6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="La4X65W6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61469C116D0
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Feb 2026 03:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771473115;
	bh=X46UpLW2j+eyZ6ykAjkS0HlxNYklVA+kQjtmNdaEaUs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=La4X65W6UQ6ne9cUU6H55pRNgKhI5jBhi55Zj0Ym0G63aaG+rrIMo/D211v1/gLha
	 H1GXM+6YGhdTVtrs8FjDryYB/hPmC3HSasw/WgjAlLxjduM+XY2FBOyA8nWrYEwmoT
	 2ljArH4oOzoRAexxb2BYaijdTPgf0FWEhq1z9z4XXTMC0d8LT92P5/CJeEuQld9kit
	 7Go88e/N5TRnEQveqS6MN+1MUl2EXFGXs/aGgjxSrQg66MBh7EhtuJBBFi9YfkEETc
	 1Lca7nwdZ7ObS3+3uGPzD2SpnPG1wn5ncXtSs/byesyvzCbooNxyQQayxh0T49Mh7t
	 tatYqoBVncgcA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38710d7d8baso3741091fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Feb 2026 19:51:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+MMlt+r2UWJNOylHWNFiypgb25btGA6SeHjL+OGQIwZrSNv5xGtDpoUyqJ7mWtS0FdnofBk0q4BOXPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuAwuCFVbiIsfKOsE6cnPNrgTuMnk1YkkWWJktZ/aC42GjGaCe
	wx8xj9yNNNbaewALu8S2jE0kXH/BYUYEwqSPookCiWtYPJsf8nS6aXDQneN0bzZK2DR9SekUiK9
	rn/XngduWKSDuj6QoYKyP4w8HRJL7m6E=
X-Received: by 2002:a05:651c:e17:b0:386:4776:2a04 with SMTP id
 38308e7fff4ca-3881b8da106mr46506631fa.16.1771473113628; Wed, 18 Feb 2026
 19:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218183454.7881-1-jernej.skrabec@gmail.com>
In-Reply-To: <20260218183454.7881-1-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Feb 2026 11:51:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Y0G1UFRJCue+x107WDj_9Nk0cXuMp3AV4yTKW7QbFsA@mail.gmail.com>
X-Gm-Features: AaiRm531971J2FLwKv3FM0ppn6z4yZUtNAfD_zMfFtAHtrup-P3e9dbLMfVsCt8
Message-ID: <CAGb2v64Y0G1UFRJCue+x107WDj_9Nk0cXuMp3AV4yTKW7QbFsA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: mixer: Fix layer init code
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 2:35=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Code refactoring dropped extra NULL sentinel entry at the end of the drm
> planes array.
>
> Add it back.
>
> Reported-by: Chen-Yu Tsai <wens@kernel.org>
> Closes: https://lore.kernel.org/linux-sunxi/CAGb2v65wY2pF6sR+0JgnpLa4ysvj=
ght5hAKDa1RUyo=3DzEKXreg@mail.gmail.com/
> Fixes: 5fd711adc0ba ("drm/sun4i: layer: move num of planes calc out of la=
yer code")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
