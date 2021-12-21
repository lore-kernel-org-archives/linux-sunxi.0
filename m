Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C101168
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Dec 2021 10:51:49 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4JJCTp5wTrz4x621
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Dec 2021 10:33:18 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="xBoRwSPd"
Date: Tue, 21 Dec 2021 10:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1640082782;
	bh=pXB8OtEXG/jGofY2Qa9yUBavX37a5hZrYWvWrLa5VZU=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:From:To:Cc;
	b=xBoRwSPd+6DJPTYCvqswpH6Dq8sR6EItvUj6RLNR6dgugH8pxKLemZgoR1PEzbSM1
	 I/ByCdUHEYd6KlydLypN7g4JoZWdmIvg53M7d5ViyoqBbNvjszgAtd+fQ8OW/AwgMr
	 o8OgNADy0hDEoD1i8jlo6Sf9/FPzOqyWcLzHt4rlxyvTygBp5y3unVsLXSPTWuhIQ3
	 HQvctBehocbc9XKtTTQ3MXb8lk4EsMo3ey2R5SP3NDzEF6hs6PUz2NzlcXemS42Vpf
	 n+aX9BhuyA9OnpIpxbOQsVi/b9EPOEURm2Lr2vgHXMxGFc14vjTE7Y0NB1374cJHle
	 rqxXkFL6adAow==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: robdclark@gmail.com, freedreno@lists.freedesktop.org, jernej.skrabec@gmail.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, wens@csie.org, maxime@cerno.tech, tzimmermann@suse.de, sean@poorly.run, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/3] drm/plane: Mention format_mod_supported in IN_FORMATS docs
Message-ID: <goOOXRPhPVm7JnHxD3xB6AeyPfmtyR9whCUnuDXyKv1uhyy1cAUJimC-ITTEFI2m8AUuINYGRViCjFVavsXEKy4PILOJiGM_0031fi900tw=@emersion.fr>
In-Reply-To: <20211221101319.7980-2-jose.exposito89@gmail.com>
References: <20211221101319.7980-1-jose.exposito89@gmail.com> <20211221101319.7980-2-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

Reviewed-by: Simon Ser <contact@emersion.fr>

Please ping me in a week or so if nobody objected and this isn't merged.
