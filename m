Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C94548E6
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 19:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708628944; cv=none; b=AxqVGcejQr5GgEPYDdtxA4hG75F4fzWTMRoTj0xEk+ewKsuuoFRrfqA+5fv4w2mXGypD8AYrRfO0KwX59wTVaaspkOlHeJiWnbBnUrlMxdDuUeJv7Dxp0hxjVsK1fIfy+aJj7pE8LIY2NcYbrVLl+7p6X8iQ4W7YNBFGoiI56/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708628944; c=relaxed/simple;
	bh=RJ0wnZP3bPYHw5LH8oH4Ou1+0h6qBwHl/euNr1MM60c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKPQj1iinX4+HQq3B2o8qYiOZU62mxHQT0H3lP5K15MiTzMWhFuBHz9Zr1cGDLvyXDC8Gi9SbvSdImlBIrh07n5AEoQ/FvNKPCD0UeEUup+TpaBba5w8vOktU2GgXPB303EKO3tmBaQPSyjQpS3nnDrSS+7nnfrXxvDoSxMzuRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv4szBJj; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv4szBJj"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso1929081fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 22 Feb 2024 11:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708628941; x=1709233741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gj4OdywnDrbhFJ8ybCj43LZc89cJ1Nm8au4Dqi6GFss=;
        b=cv4szBJjpTqCXg00mkMXzFop82WIaQSnUBHfWlqalr6haJLETS0l4JQjhG03+CkiCe
         nEEm44X7tZo9ryKznwEjl14P3x+tyIPA/bTCf3Q/R8Xezh2G9BzrldsgaHMMZbblYb9f
         G31MsWEe3jC9UWfGKFzkYO7B2+3Ce4yEpdZENSv2XLmVIdNh7J4Dbept1CofR7dga3uZ
         W2uJmlKw/fIYFBhA2XmYCfCJrLxx17J2A+2D6MhhY8cyHKmm1qMdB7Pflnj2JvQrRHHv
         1sE8GJ9BqdogN9i7JjYwxM1NpOme5Olj7NFXwesOm6vaFILLZyKXP+fMnMJEOO2+I1f+
         o/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708628941; x=1709233741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gj4OdywnDrbhFJ8ybCj43LZc89cJ1Nm8au4Dqi6GFss=;
        b=mrcJ9CuBKzZRg+zRWD1CFjsdUbWX29jCq7HXJ0S1PhtUqv29bsTmXZ8UgOwiqopH3B
         WxZv02qccKSNmLwjJBB8NLD+hEuOQ45MLRMj6DfmLQNdBwYxMblT/+LyvPQhsSG34E4Z
         +/0Zo3fJUcUEIDs3aM6nyEtlALr8vw6esmLB1Ga9AsEMwVyPsqQASfZRyyG/YjUzwBy+
         7999fur6xM5H0l5xmrQzCi7vndc9iA0udLZH2xULeCdJgxL2S0vWjjbHoIFjCKib/4gM
         mAhAw+f/rPEA7AgYO7a2Ts814kKGq1ZR0QtAPUEoytfSNEiD6h1uB5ryyGKYBrhSyPLo
         Zf5w==
X-Forwarded-Encrypted: i=1; AJvYcCWdkiE4HFCn4X8o1rb2Ft+hKGN/T4c4d/A7a8/8Joh8YiJK7nyUHyxu0rlE46NCUbRxOCAqKthUkCRqaLrDB29HYN7H0DowSfZAk2Q=
X-Gm-Message-State: AOJu0Yxj+ltCjdCvesLKq66dyNionUS1sn7odIylmY3KPSxnR+5vXaO+
	wznWCJ48buZ2O0p17RRAPLCs8an6gdOcPcGNScqdp8bJhACOdt/I
X-Google-Smtp-Source: AGHT+IHe4b3hq/UBTGy8TGAsD8s1quxqZkNvTf7s10vKGsFhX0a+cS0Vaxi79AU03ziWQo+MQ29JhA==
X-Received: by 2002:a05:651c:210f:b0:2d2:6574:4011 with SMTP id a15-20020a05651c210f00b002d265744011mr1451054ljq.30.1708628940711;
        Thu, 22 Feb 2024 11:09:00 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id g14-20020a056402428e00b005642bcfed99sm5293270edc.23.2024.02.22.11.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 11:09:00 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v7 34/36] drm/sun4i: hdmi: Switch to container_of_const
Date: Thu, 22 Feb 2024 20:08:58 +0100
Message-ID: <2172115.irdbgypaU6@jernej-laptop>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-34-8f4af575fce2@kernel.org>
References:
 <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-34-8f4af575fce2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 22. februar 2024 ob 19:14:20 CET je Maxime Ripard napisal=
(a):
> container_of_const() allows to preserve the pointer constness and is
> thus more flexible than inline functions.
>=20
> Let's switch all our instances of container_of() to container_of_const().
>=20
> Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index bae69d696765..c276d984da6b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -30,19 +30,11 @@
>  #include "sun4i_drv.h"
>  #include "sun4i_hdmi.h"
> =20
> -static inline struct sun4i_hdmi *
> -drm_encoder_to_sun4i_hdmi(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct sun4i_hdmi,
> -			    encoder);
> -}
> +#define drm_encoder_to_sun4i_hdmi(e)		\
> +	container_of_const(e, struct sun4i_hdmi, encoder)
> =20
> -static inline struct sun4i_hdmi *
> -drm_connector_to_sun4i_hdmi(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct sun4i_hdmi,
> -			    connector);
> -}
> +#define drm_connector_to_sun4i_hdmi(c)		\
> +	container_of_const(c, struct sun4i_hdmi, connector)
> =20
>  static int sun4i_hdmi_setup_avi_infoframes(struct sun4i_hdmi *hdmi,
>  					   struct drm_display_mode *mode)
>=20
>=20




