Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A129E117
	for <linux-sunxi@lists.linux.dev>; Mon, 25 May 2026 03:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779679570; cv=pass; b=RW5IUGeK6uX4AOYHX8AV6j8bsW3WuViIIAWQM0SsWdYbgyLKxKIt+qlu/B1DuGlSP9nRM+FXiH3sCa0qtQJ/asq3a5AgXrzYMiNIDo+0SLaSRfPw71Nn7YSJp1xIY4QI8y4VAbXgdSjqh8B37x3WsUfr2os6Hu/lX2rP2qsvFd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779679570; c=relaxed/simple;
	bh=Tcjwar0ujMRUYwQNWOI9owhqHhcwp71+Xytox09KV28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bR8Ospak95/GuD9LM/TOtDxAFqAFM6G6RWIHSo5BuIKx3PhcNzHFSZPJ690mLWZiWMYVyhmDOERMW8BcXxB5PzTmxRp7kFKpfsR3g3KiSZtVUr0cv100S82FkXBOnb48k/GcxFuUrUKMKOQMk0ykp3IqprzbZKhrYCDfxg5rOYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQU6b9mP; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQU6b9mP"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e6128bd9b3so1151543a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 20:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779679568; cv=none;
        d=google.com; s=arc-20240605;
        b=ST/wT+sCwk+Pz+VBE04augI2anzY4h/88h11RC6IAqsx0E9kTdJ4YdxftBFtc3UHdY
         7tSKJiCTD66aUR6Z8PIno5waZVSGXV5J3leWZZyh1Cw0TVjwD2qc0JZxMUuLDwv2qY1m
         ggqmotAwy936IOuWDklVhPWHolTQQcvUFTjHhR0eamk2emfV1s60Z/q1dneVYh2nt3ht
         JJw1BUmnp6lm0ltfe/cC70NSH3dhmTHcRtJtTq7eNWJKlW2lY3oufawkRaqgYOyUFcW5
         V3PvVe01csvSNS/d5EnP+irdkCfiydTyyBV52+cU8+jO5DX9bEBM7Spztml28BB2E0RJ
         i8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        fh=S4K65NjS9CK3rvlDdURSrRO7VYEM/UEOBsotNIyfXJI=;
        b=TFvG11yjmescXi/78ygyEBvNMnHWUuQPfEqPdbTPu8LtDAVN2VZVyxO5uAa+vksT88
         xWAm5sxI7rNpth4XTAT8n5qId5i1J3OSNWN8606Jy+6sV5LrCTBqi8+JgFXY31Lx40bU
         +XCJxqHsKi6UgDjkHbqzicoHkmk8KWxfiYR6/rHV4iHWcecjQ9C/HIfAw5WYIHidtCjF
         Bn89UrhILY4aMHHhmzSxF7/6D5Yzx4WqJwqbv0RTKb7Bvd6H3vplzZlJrSIaujfw9b/+
         DHuXfLLsjIDKRDxdVHjVrxVXNXz/byNAqMINzqraL9HDwZX0xKoZYhn+QHEZ1+aaT7XS
         bNMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779679568; x=1780284368; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        b=qQU6b9mPKqEQIgWFfoBrgFFcHhn02Fv/PwpFH+hN2gaKcSUMTTDUTmTjfgj2v4aTgE
         KgOa+Z1FGqM07ujUSHQJon6hTDI14kQdUtF15vfdqRA6AJ3H7rzIPIer0rRwLp2XbD6i
         v4HbgwAY6txOWp8kZxpbl1lwQuArfktSbET+78Rn0qbB9NeEbwzYtW9qGLj1jDhV3r5J
         /8NmuymI+MSFXqCHE8Shx7VVJUDCMcKsLW/ziE8kXF7eNP42TJys1yFPE/+SeD11MaCn
         6JSU/C0iB/tjwJ1+k1GtcAh/P9zg1X+mNjOgvWD1yOqwzKV3oqhYG8XzQ2Us7VB1kNvl
         BD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779679568; x=1780284368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvwfuFavRTickP2JgkskpCqaYMIYAPH+/fczcSyou0Q=;
        b=oSQGuxOrSwqqx/JnXUz8CLVA1tByMpfnXiiilAeiACnXxB6ED90vwrty3GHWXzeHIi
         7liATpblrwMOz2oANpUuIsWF2xDfK2HSQzXAK6BE9opeLQAd+56IHQjPDV/MGa08sxNA
         w1YxnJZMYT7wwLbzDMVi5AstpUA+ApqNPfnIAUH3eJ61YF4Bcu/N4qgfgM67W9E1jLHd
         6ek0s+4c+1PKWn/o7eHpZ5o382iVRnk1FsX7Ajxz8huHdA68zQl/9D7aQH1rJA8YDeiI
         CF1hCZMHC5XYZyMB1fg+eClr+LZZluNE8nYZNAFJx2jA8Z3r7VrhSFhQl3kn0Gcgz4fm
         foLg==
X-Forwarded-Encrypted: i=1; AFNElJ98D7xwmxQ9SXP6dQEt385O6c9m7F1p3QL9i+OqL5yrsu3Oop57x0GP0m8ErdzJjdIn966Je1xyNmCsUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz7gzZDQNCqPycopgkReIW8Wc/hRH1Yio3nBt/XHoYysJGFpAS
	6dkq2upuW1osLFzRfvBrInUfee9g4iW0Nb698UHJs+Iz/gAnyQUoXRIwbyoVAQOj2ZetCHiP86J
	tpORp1floQPBE+rhOI5HfiB66EPuVC383oIMYukWrxEHiHEQ=
X-Gm-Gg: Acq92OHw3gVVDQFG3HOv1diLS+Y3ff+PgBusgm0ZhKnZ0X//aJvNtek/gh2wwYvcMMD
	55WhkhmDMiXQ+B/ApXENj1Ht2afmlhWmB9Why1kVyHE6tHbRhBnJPJkD+hjzHP7IhiW6ZFGocZt
	Go9cihwu2UHV/5mw6BHlgJYpzR7WeIUVvhDuTe564edwQVoWoKbY3VS1ICJAqR9MKZCRV6SlWqm
	LhmxFhngazzjP3W1GeP2XkJS9r5hiGWEIEep/YC0Hmy7zvzreA02MW5E/gGp5yNoM5pH/bix5mV
	qDcd2JLJclyIl4AyFoMdzvEO9fFTLb8XgRFU60pIgtLyryB+auVFnZwcJGyYaMjjCRPI
X-Received: by 2002:a05:6820:4b09:b0:67e:2ff7:2a6e with SMTP id
 006d021491bc7-69d7eb501dbmr7243815eaf.18.1779679568125; Sun, 24 May 2026
 20:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-14-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-14-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Mon, 25 May 2026 06:55:48 +0330
X-Gm-Features: AVHnY4KUuBcGh4fPuvaF9wKJBQKBE4TDK2MAAseg_T5QDDf0jB-H1zPi4i_Lwlk
Message-ID: <CAMxPZkjfWckb89HeZ1aZU6szkvfPm6J20HH2+O2C-ZoftR1YsQ@mail.gmail.com>
Subject: Re: [PATCH 13/16] media: sun6i-isp: Add dummy params link_validate implementation
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, May 18, 2026 at 2:01=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> There isn't anything configurable about the params video device link,
> but the v4l2 core complains that no op is provided so implement a dummy
> one to make it happy.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 77c2d06c0436..b7ef33fa2b13 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -450,6 +450,18 @@ static const struct v4l2_file_operations sun6i_isp_p=
arams_fops =3D {
>         .poll           =3D vb2_fop_poll,
>  };
>
> +/* Media Entity */
> +
> +static int sun6i_isp_params_link_validate(struct media_link *link)
> +{
> +       /* Nothing to validate here. */
> +       return 0;
> +}
> +
> +static const struct media_entity_operations sun6i_isp_params_entity_ops =
=3D {
> +       .link_validate  =3D sun6i_isp_params_link_validate,
> +};
> +
>  /* Params */
>
>  int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
> @@ -470,6 +482,10 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *=
isp_dev)
>         INIT_LIST_HEAD(&state->queue);
>         spin_lock_init(&state->lock);
>
> +       /* Media Entity */
> +
> +       video_dev->entity.ops =3D &sun6i_isp_params_entity_ops;
> +
>         /* Media Pads */
>
>         pad->flags =3D MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the following pipeline:

ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-isp-proc ->
sun6i-isp-capture

I verified that streaming through the ISP pipeline works correctly
after this change and that the previous .link_validate() warning for
'sun6i-isp-params' device is no longer triggered.

Tested-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol
