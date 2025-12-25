Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10CD29BDAE
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766656507; cv=none; b=ijDooqsJ9giVnjq09FOn//HWNxMbJwGwAgABl11ccqj97HBI1aIZKt15MYq+ftkwo55sxL/h03JOiqbW8LAG1sqCv3AP8XufkJhzXNOSiBQGDTCdaIwrnXVC6rB5pIJXBFawkXI/0TVghz0qakRIwfTUheWRmMFLT8lNRVmtkGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766656507; c=relaxed/simple;
	bh=GilIDlHwNmX2DvdXTed0gVD0Xc+JrJf6zdMnLyNlqeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hn48yHTpZAtJrCNoL8Wr8NgdLip3WZYDYE7WW0LuR9/xjy/7C6eYsM/sFFzoaLnyygrbtdNQ3eQ9AhP4l6rWxmuSIi/WyGo2ydFctbP5lzkiUpmsSM3MNe0td3uN0+kh7xz1aHH1WJNFG8WJfi+AHSGXs02hf71eAO8qne6jsUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jk5cbEvg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jk5cbEvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42912C4CEFB
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766656504;
	bh=GilIDlHwNmX2DvdXTed0gVD0Xc+JrJf6zdMnLyNlqeI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=jk5cbEvgYqzVwBWFCxmEF3jdg+Lh0ZwqE/XWjx0qq4BHivz1PU+vhK4zZwLPJ9Qi+
	 7pb/KvqKMvPlt+xHJXj0jTyxSYTLQg2T+2xfqBj+KdTeS4TEg2CabmfzsmUy5xzH8X
	 4MzvkMv50/D0q0cC9A07TiY2ykSxkmV7C71pRcwgbjOSuOx7Jyt75+NSrciVzy6Jky
	 DApt18hwp6jgJq/Hn0YD6DBYH1gzSgtTL7ghG8wXiw0wQ7cQJA0DbjvIEPxjlp5mGw
	 JAjpzD1to3mBmsM/5wJjfAC9TAlmTbL8H9X93f5mS0d9teXmZjASYD3rV4wa93e/cF
	 fwMYGyxBxX+7w==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6575e760f06so1747872eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 25 Dec 2025 01:55:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIq+6T9DPRQNa+Cvb852J4lTMWRiECfBfqDzBgffp0u8swaCaA4NMB2MO3u1ML1tQTHgv2dN/u7ExhvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz/zH3VUp2hf6hlaMKmPyEQkvtwvKN5/z4fk+Lg4rSATmdF7Hp
	Hof+TdNT+m5jRntuyuELLQvybEirfSD5GIU9qtcXpsSWiUxXByCJgz7/KkEojoYGmfdCs14VAr7
	rX8sh+N7IN42QwEHZLYWB9Y3FRljY4pg=
X-Google-Smtp-Source: AGHT+IFnkfQaJeM9o52pGeAsmGmsmCQF0mX9H8Ff5URtY5avsALv+90AlwsZ5jqSLRXCn8JBK6tiXl/piSwLMk1Yfvs=
X-Received: by 2002:a05:6820:6fd7:b0:659:9a49:8e5f with SMTP id
 006d021491bc7-65d0eaa75efmr6243347eaf.47.1766656503387; Thu, 25 Dec 2025
 01:55:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124033301.2987159-1-rdunlap@infradead.org>
In-Reply-To: <20251124033301.2987159-1-rdunlap@infradead.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:54:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v64d5wfHHQZd7D64RH0YukqewbGyPmwABoF0SNrf-yEn3A@mail.gmail.com>
X-Gm-Features: AQt7F2r2EWPiUxRZoKWZgkAX6QaCio9hsu-zhnxn_qnEeaMgGQZAl08REyABcws
Message-ID: <CAGb2v64d5wfHHQZd7D64RH0YukqewbGyPmwABoF0SNrf-yEn3A@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 11:33=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Correct the kernel-doc notation, add a missing struct member comment,
> and add a missing "Returns:" function comment to eliminate kernel-doc
> warnings:
>
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
>  kernel-doc format: * @mode_set
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set=
'
>  not described in 'sunxi_engine_ops'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
>  not described in 'sunxi_engine'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
>  for return value of 'sunxi_engine_layers_init'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
