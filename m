Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33173A1A2
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 19:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713729183; cv=none; b=TTLkZqQ5H8Ee/w9dwbjWkKjOdDLxuuenQ2rpqEA6m7B7qH2XJMnb8p197+7YynOwBdO+lIIVe9Olex9FrsysRIwXMJjxVef31VFd6Gasp5TVui+lE0yLtn/MMByfgROq8XLQHrL+09yk4UUISnn0A8kdN4uZMbMmHJy/w4pUsxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713729183; c=relaxed/simple;
	bh=0Zw43nCq0snAHABmH7B6SV89iFyXVG14aowboRvSbWk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4YH/C5n4TWNBYvhBXkTrkJs3vZbsEEsSF+kB5KLLen308oKyaBKsWfe9B95XS2BMlSYdpG1bAEsrIqqtQVE9oVC7m73D/NAOVPcf/YtfNqCFaj1IaRE2esn+HGP7ibYv1mE9jQMMWkNziSdDwtHwVfKMBNqAMPoxosdKIVujI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ig1bQbzv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig1bQbzv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34388753650so1762290f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713729180; x=1714333980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMaenB/28UTgVBO1bvU65I16JiSLNMn+INLi6fNav7Q=;
        b=ig1bQbzvhMR7WVqg3eNw2t79W/P4IeHAZAHNgDzPH/Caa1GKUk2Q2JvZwgosjEIPwz
         DMnXM6+KSzt9C439j9XaycvsJrV62OxeSHLi1pTlSTBxkTwghCE9+DzDVrrDI+Wekh5O
         IOlLbpLO6JsjFB6KpxnsTiiDdEJJziJcW5XYKD/UeEUvykm7I45n8TVzNNMEJDLJKIft
         1Cst7cEga1Rl9/mRJXwNNaqaHMBSFPgRGQaFc53ApyG/+bUJd+J67byQiXSE3nvK0J+L
         Dec1BFSoeAVLMTw4hHkxgseUeU9turWzjB/Z8R54MJM9cfcbqCfBGd6GrYodoNoqXYcu
         Opkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713729180; x=1714333980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMaenB/28UTgVBO1bvU65I16JiSLNMn+INLi6fNav7Q=;
        b=uFmmmODMPOKqcwdJ8WJ95XaqX7SgNOMUerm5pXv3K6926WlJfJJtWpVrCsxNi1tMb9
         dKCokh078bUxOj4WfDsseTHOGR6gra9Pv/FmOIgIZRcAAnCdIu02FCNXug77mh2g2zZh
         X00R0IKysv4YucwZSIMCFIJMd6L2KXJw9MsmL87+lvF9rD0+5N5M3roRAZmPvxsoHM7r
         R1Rld403QEsZvXTb/Oqem7wWGjHZX8770zGa74qmxsuWvwxO2w5PqPif6RktZOUX/QNf
         KpZBWSzvmiuE8Frj7UoEKKnEUWnrKp1M1rbpC74xct8QEFPSFcfd1qF1j/9jOXVZAG0z
         cAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpWItDP0wBqdnaP2GdFSY8KmE607IO6d0+en1edUDUPsCmX24wmmwSdhA0ppv2lPWa3UfX3O76OcpC9HobYW9hG+kjZnnDbZa7qgQ=
X-Gm-Message-State: AOJu0YzFZFUChhccgIcAPg8tNB6XMm5b0L2d6jP8u6NSy6Xa1iVqpnXb
	5k7bpWTe4XiV9epvRtMgGltJW0HjKvmysenBctWygFVAOxaX5/r9
X-Google-Smtp-Source: AGHT+IH+FOSeFQjKP56pJvGYgnwg2xOA1gAlCxEdbMe/MGWtoLYfC/TIEOFAPaMrgTx6JTqFla3PYQ==
X-Received: by 2002:a5d:6083:0:b0:347:f94b:94df with SMTP id w3-20020a5d6083000000b00347f94b94dfmr5847674wrt.2.1713729179923;
        Sun, 21 Apr 2024 12:52:59 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id x5-20020a5d6b45000000b003472489d26fsm10129829wrw.19.2024.04.21.12.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 12:52:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: =?utf-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 0/3] Move blender setup from individual planes to crtc commit
 in sun4i-drm
Date: Sun, 21 Apr 2024 21:52:58 +0200
Message-ID: <2725781.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <wynuwtyn2skchb7gc5qixql2pxnb2nqvbmrda6s53u7nt5ki7n@hqb46kttkhee>
References:
 <20240224150604.3855534-1-megi@xff.cz>
 <wynuwtyn2skchb7gc5qixql2pxnb2nqvbmrda6s53u7nt5ki7n@hqb46kttkhee>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 19. april 2024 ob 15:36:17 GMT +2 je Ond=C5=99ej Jirman napisal(=
a):
> Hi,
>=20
> On Sat, Feb 24, 2024 at 04:05:57PM GMT, megi xff wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> >=20
> > This series refactors blender setup from individual planes to a common
> > place where it can be performed at once and is easier to reason about.
> >=20
> > In the process this fixes a few bugs that allowed blender pipes to be
> > disabled while corresponding DRM planes were requested to be enabled.
> >=20
> > Please take a look. :)
> >=20
> > v2:
> > - use regmap_write where possible
> > - add review tags
>=20
> It would be nice to have this applied.

Maxime,

do you mind applying?

Best regards,
Jernej

>=20
> Kind regards,
> 	o.
>=20
> > Thank you very much,
> > 	Ond=C5=99ej Jirman
> >=20
> > Ondrej Jirman (3):
> >   drm/sun4i: Unify sun8i_*_layer structs
> >   drm/sun4i: Add more parameters to sunxi_engine commit callback
> >   drm/sun4i: Fix layer zpos change/atomic modesetting
> >=20
> >  drivers/gpu/drm/sun4i/sun4i_backend.c  |  4 +-
> >  drivers/gpu/drm/sun4i/sun4i_crtc.c     |  2 +-
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 70 ++++++++++++++++++++-
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h    | 20 ++++++
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 85 +++----------------------
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 20 ++----
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 86 +++-----------------------
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 20 ++----
> >  drivers/gpu/drm/sun4i/sunxi_engine.h   | 13 +++-
> >  9 files changed, 125 insertions(+), 195 deletions(-)
> >=20
>=20




