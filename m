Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF4C233924
	for <linux-sunxi@lists.linux.dev>; Sat, 23 May 2026 04:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779510903; cv=pass; b=QJ3d6N8K+j+ock2EI6Qm2nRcerLf+R/Au0UbgUztNXZ2ftEjEGgN9xDM2QJ4g8qyKMPzGU1zetZxKWqsQfA3/d8B+mCdBMuSCQaRjlyHh28XwT4g48/rIbwVR+IobPg19+ymXOj98vBf+ekpnhQBePvc6oe7YfkkX7tRcMqTgQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779510903; c=relaxed/simple;
	bh=jpTwqZr/Q5gQVOlqJ0S2yDPGDJKQkPbLyOemLlhRRsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRZjxiyLLVLq68i5N/8VmMbCcqnUFXuo5d2D+si6UQHK6UcN71N6O6/VGQNhFeBlYg69b8/GBVoOl8fzK/teTMTwp69l5N4grLY1W52rbqTkt8ar0XwghcYlLsztSRSpet8uOvUdzFCkeaY5LjlEBE8Hd1YefRWjcW9ugBeXxCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfbC/4ps; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfbC/4ps"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-439acb393f7so8704608fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 21:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779510901; cv=none;
        d=google.com; s=arc-20240605;
        b=e3JbtXq82QbzDzbi6XqIC6F9dyqYm8oBzU/jNjMMJqexr34/XlO4vyk3On+4yZ0lOR
         dzGnsNvPhrvP7blvk/Wpa9NLzvmNdGQp89jpyyb1VyW1O9Err2tc7DOjh08lfBm9gT4T
         WM4nwwBX8KUxf0jqJmqJHrKnKzwPP53X/oIHBiA+k0aP3fD9xaLnXFg5cd7t6fc4Aeho
         hzaqJ3T05PkXylvBgfyubZwQGulwlmQ0VuZOiale/LXCb9tkhjsqHbWHBoBX7a5waYKb
         Glavbpwkt4tlSQQZdAYv06zjaxvogpHG7aTPfTwZieJ8NDpawaO9JDet0re6Iz6pXCMl
         x3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        fh=h3QJl+21E+gqd4pWPFsLVEGIHM+XyXrsPD8tvhe1Egc=;
        b=B8EuMmcuy1bcB3LV/Ra6vqRIO2M2XNKfvHavgkbcDafI2iKA1GQOB3wwqo7PARtAQU
         NXVt107MBVOq6eJUNO8fIv0B/wRdqBrqRkUWHh+pgIksDR1B88mnhkt+KSl5f3IpvQFy
         fCXWWDF2Dh71hWOARFSZcstnjFDSQqXKNJy9DTRAbeDOz0fNJs6/hPjVT5YEUE66Wq7S
         PqRKDOZeFzQM47fY/CxXT3WCp/0DtjDVbyaIf+tOFjCOllAALQx+M68OaaBAdPPGsQU6
         XiTRAwMId0PzgqMABmMNqfe6DKrrOeO0gzHOaIs7v/pHOA59Ya62x9FGJWvzZJvmDioL
         qFdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779510901; x=1780115701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        b=GfbC/4psRuAp+TRnYeBx9u2OohtgaQgxHLLdVBGNiIHZD1X/ZMZIBghwg+F4ozUCQQ
         F7E6v7syGqFmsbSIK89r+2cd3QIQCDgFTMgkvE1KCW7OuEPxLZgOoq/Cv3YT51bsNmpB
         xhE+TxNkuYlEEnIBvwP3CxY1ziVe48Jtr9MSGEa7CCzOajCN0iw92ZbS65r2ZvZKq8qo
         Uh75amfY3jTeBnVOW3qf1gsfmYAIG3JhnW+0+CZYc3DH6TwpX49MvF3DAjE5EcjD5qpz
         fI/1MXv88oQIa8M+82EqlxCjuN2GowqA69jMTszvjOyy5qkOWEMN/s1YootTT8AZkFT7
         C9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779510901; x=1780115701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vjwen8pW+3nbnlCQULsmeNoF69s54+b6PcjKCfFeltM=;
        b=pnIPIDBrCdKVUl0EiJSU1q6MobC2up2pI0tYH02IhQjibRKHODPF5+jkjP/eODk42+
         cQ2Us7ihelLMIYywEYAD1/JQ17QEtNKV3uXiHFpiL2cQikFI0+3H/pShGKWdWkX6VHVo
         VvGauPRM0uU2NkmUR4kgcWIwAHhBlwn5PNDb0mZjgBpINkrfejk8Vbictifeg3+m/ewS
         8f4iqKiqjD11SXOFGzYuOhocvK5mQpibgqueaWxt9CaK06riEdLpXYvjC/EtLD1agsFa
         F4/1vkwrjKNHHCYKnPExwAzFWnTaMAKCwf74is95x6ikPbzK4VA8omZpBiJcf5JXVksk
         BLCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TEqp7NROHlKc2IAhd5xuky+GQuQf8znS+kQPxBVMZq0C31lZ9Jb6TfSMLsUMHSjvnQknn1COC5IfVyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVzDhELrnfJ3byS4rJTAK5X+LvHXbiuZnDBbnQVmlabb00LrWU
	s6M5RF5mlHDeBtlct324JYidebn+Z8FdUadyXeVBl+uSHbm+K69t77z0+vC9ewArLkdjuQvRD/C
	IRql8MmZnjUiquh3NQ8cbiC3DAtlzC2g=
X-Gm-Gg: Acq92OHHrgQKg2BtqKFXZ5FAI52gbwXGvfq7JWm3qZGy7vEm+nzb0OOJ+knEfRjQErz
	gHeIVFw1BLLyXMK/8XarLn+U2m0ETaS70UyUJqW8ZEjaX17Ej/2Ic1hukxtkJwBcxnYA2vCREeg
	V1O8VCwnOLFXU/6cfIpDKL1BQqDbSJv+IAOaPj8yVzAE5fWSynvyxXxL6emkTPp5020ZnFzelKM
	OJsi5+yndHXYmsV4WP2IkrbBcqmgR+t8EdgLOiEh6sBtnM1+BO+zSK1eApwTZNpDeQ1vnB02SD/
	6+/3Zml2Q9eocVN0VvE/Vi6xdfopuS2rbWpw8o1oixyjDRO3PfMsy1pXPDB+mJbeqg==
X-Received: by 2002:a05:6820:1527:b0:67e:16b4:aa13 with SMTP id
 006d021491bc7-69d7ed3ddb2mr3655129eaf.58.1779510900956; Fri, 22 May 2026
 21:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518102451.417971-1-paulk@sys-base.io> <20260518102451.417971-17-paulk@sys-base.io>
In-Reply-To: <20260518102451.417971-17-paulk@sys-base.io>
From: arash golgol <arash.golgol@gmail.com>
Date: Sat, 23 May 2026 08:04:50 +0330
X-Gm-Features: AVHnY4JvnA7ojDWW97GlknLev-z2MRzqG6cGTuP_DqdsaaWX-ot3wdOD3pLiTkg
Message-ID: <CAMxPZkgODpNgaFAnaQQNum79VQyt9nV7LpEk6WZqpcqnKgUiGw@mail.gmail.com>
Subject: Re: [PATCH 16/16] media: sun6i-isp: Add support for frame size enumeration
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

On Mon, May 18, 2026 at 2:02=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> This implements the enum_framesizes operation, which reports support for
> even sizes.
>
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 372b9331bd6d..e638ec32c7cd 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -452,6 +452,26 @@ static int sun6i_isp_capture_enum_fmt(struct file *f=
ile, void *priv,
>         return 0;
>  }
>
> +static int sun6i_isp_capture_enum_framesizes(struct file *file, void *fh=
,
> +                                            struct v4l2_frmsizeenum *frm=
size)
> +{
> +       if (frmsize->index)
> +               return -EINVAL;
> +
> +       if (!sun6i_isp_capture_format_find(frmsize->pixel_format))
> +               return -EINVAL;
> +
> +       frmsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +       frmsize->stepwise.min_width =3D SUN6I_ISP_CAPTURE_WIDTH_MIN;
> +       frmsize->stepwise.max_width =3D SUN6I_ISP_CAPTURE_WIDTH_MAX;
> +       frmsize->stepwise.min_height =3D SUN6I_ISP_CAPTURE_HEIGHT_MIN;
> +       frmsize->stepwise.max_height =3D SUN6I_ISP_CAPTURE_HEIGHT_MAX;
> +       frmsize->stepwise.step_width =3D 2;
> +       frmsize->stepwise.step_height =3D 2;
> +
> +       return 0;
> +}
> +
>  static int sun6i_isp_capture_g_fmt(struct file *file, void *priv,
>                                    struct v4l2_format *format)
>  {
> @@ -522,6 +542,8 @@ static const struct v4l2_ioctl_ops sun6i_isp_capture_=
ioctl_ops =3D {
>         .vidioc_s_fmt_vid_cap           =3D sun6i_isp_capture_s_fmt,
>         .vidioc_try_fmt_vid_cap         =3D sun6i_isp_capture_try_fmt,
>
> +       .vidioc_enum_framesizes         =3D sun6i_isp_capture_enum_frames=
izes,
> +
>         .vidioc_enum_input              =3D sun6i_isp_capture_enum_input,
>         .vidioc_g_input                 =3D sun6i_isp_capture_g_input,
>         .vidioc_s_input                 =3D sun6i_isp_capture_s_input,
> --
> 2.54.0
>

Tested on a LicheePi Zero Dock (V3s) with the ov5647 camera setup.

The enum_framesizes implementation behaves as expected and reports the
supported even frame sizes correctly.

Tested-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Arash Golgol <arash.golgol@gmail.com>

--=20
Regards,
Arash Golgol
