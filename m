Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7C387357
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339024; cv=none; b=XKhvfzAyfqmFdvkrktIm1qSwoh28OiLHcVwhdM8UCtn/F6//0+K1S75sCvSus2oXyavSeRDYqBfRasYG+c8C6OoekRB+/r25nWQPr8VyiBwFZCaz0Ls+1saUco9ZReuZqrZLzEmXchUadiZix5McyVyrfBnYK1ptMVJiYiICf8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339024; c=relaxed/simple;
	bh=p70KRl2iyiH98RwY4hlNKdUPjdh2xLhI1lhyiI1eZxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M2/t2tTKbU6Y9PEMQqMDKkUYaHO6uRPVeIrBSqBES3KWg0Z4jz9vcs2Z+cHb2VeKUsc69SMuNdRWAQzzTmPeoqBhQjoxbjQ/TW1qWhGNSbO3dvVZb/uwVnMgrdbNBWgtVL0fNeaV11qrPGH+hQwVy/Jq/hjoqhsIjnnZaPBuntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLlNif9t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLlNif9t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fb14227cso9114265e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Mar 2026 00:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339011; x=1774943811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=;
        b=jLlNif9tSX1MuX4GxECDf6xD2AFDU8gfFLJsMmsvz+2XPSkz8V7yMw1EQ8hF0Hw3Po
         TFDINU+DXskZb9wHE/2WZitTBHta55a7HiazjBfJbI3QpZZwvtYIDlX8J5W2gjHsibhr
         9lDXWcs00Dz662CKGLTU3PZsekmJDTzAopEYbqqsIUYX/ri9dahhsOe74q38flKpgkTl
         H2/zrnB3oPMuRKd21V3+zkYEJvoPAGGiYzr6gSHWS5fv3Y2UGGryZzKuvo+qipMI9/03
         istfjrfFa5EtwPS87AlXulsdKKwyJH0Ov+KaS0Q+YDjwhyG/ugxC8I/aKuUceaiv86x4
         8RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339011; x=1774943811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wFYRVrG/zXzLAZQPA+I4Qd5czvKYpC40unjGxYVlu9I=;
        b=dvcN9TPOPXnDRdT63g91ECeeHcBlJNMdA0JSwFA2n2a0UUfvO+hsauIADeKVOdYw0C
         0iee9jKYjXcAZ26t+uQHjmG9JpAIMFatENostUVy3Tt8ZhjDhlAZ73h4lg4NwtaG94I1
         4Wqk5DvYbAOKGjcqbTbvSgtsfb+asokmu5JUxrx9SlbmRQ/NE6BHUTXYhhvt2jFPJa8r
         zf6ruQHKB6ph8FthbvWVJGRgbOa97bXvwuBiIJuGjU49X9xT0OVUUDXpTVwGrJlQSPvN
         B6DNrVzG6n+Un5wU+THDtrVaYzD5leuphlB9NUdx7M8gtsFp1NajCTxg9+13fUDH09/w
         24qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu1RJ2Jg0qxFclgje20WuRD2zyjvuUJ1lF6eHt1VexFjAfzaFVEpLQkK3NieftsuHfd7ITn0XR+1zlQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHgj8BZGxM65RTBVRuSJL5THCpAlg7DTxHilLfQh5Rka0Fm70b
	vvDIiP1P4kws1s3PNZe+XeC8cNs52dHq1ZtoCXR0W8h7+RFcWMuoDPM0
X-Gm-Gg: ATEYQzwxkeZLoc7VHsP23LayI343aLK/E4AYHYX1GOSF9UJrx1unzGT0YVjlpRjWXeR
	J+eN8w8IhKBlDhsQesfyTkVr4LJ2s38Boe3Hl6SwKHa+jJsQBnPKdWnABrOXFQWNTZqZvpC++E8
	rhWOXCjen7aP8DjBpkOrs0VHBQr+rfB1XdTcSkJCDHatvJVRV6vBSkhJ3cRXzG3lYM9Rlwd8MG1
	6dUicCa1+efMk3THM8PovtU+W3eG0V/2GFnoRcwu5v3VnDzA59qVKSbBPVnjMrP5DRix4QMmEcF
	Hu9HzcvdyfERYzFi/4FwLMsNI3DBioJI3OdHfMLRE37GMB1Zd9TBMHXg+mTkNYrprYc99gfQI5W
	ZecoQ5GyvC+UKOqXW+HV01cTKYB9pzlvNom+jlMo3ooDnrXCKErap3g6f0OPcVxYApnHOVENk5a
	35MrUPe96XUoy6YOijdSI5shrGTpzP7VmlGCcKK1xmHuGvS6jJLWtDQRij7DxmnlpR/EBp050JX
	+dafm8E3fs=
X-Received: by 2002:a05:600c:4707:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-486fee231cdmr200567305e9.21.1774339011116;
        Tue, 24 Mar 2026 00:56:51 -0700 (PDT)
Received: from jernej-laptop.localnet (31.red-83-50-72.dynamicip.rima-tde.net. [83.50.72.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487110dd718sm12885685e9.29.2026.03.24.00.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:56:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn,
 nicolas.dufresne@collabora.com
Subject: Re: [PATCH] media: cedrus: validate H.264 reference list indices
Date: Tue, 24 Mar 2026 08:56:46 +0100
Message-ID: <5056688.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
References: <20260324020431.1800-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

CC: Nicolas

Dne torek, 24. marec 2026 ob 03:04:31 Srednjeevropski standardni =C4=8Das j=
e Pengpeng Hou napisal(a):
> Cedrus validates HEVC slice reference lists in cedrus_try_ctrl(), but
> the H.264 path still consumes ref_pic_list0/ref_pic_list1 indices
> straight from the stateless slice control. Those indices are later
> used to index the fixed-size decode_params->dpb[] array in
> _cedrus_write_ref_list().
>=20
> Reject H.264 slice controls whose active reference counts or
> reference indices exceed V4L2_H264_NUM_DPB_ENTRIES before the driver
> reaches the DPB lookup. This keeps the validation next to the existing
> Cedrus stateless control checks and avoids driver-specific
> out-of-bounds reads from malformed userspace control payloads.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

This has same issue as doing it in common code, e.g. it would break
userspace.

One improvement would be to skip all indices which have value higher
or equal to V4L2_H264_NUM_DPB_ENTRIES here:

https://elixir.bootlin.com/linux/v6.19.9/source/drivers/staging/media/sunxi=
/cedrus/cedrus_h264.c#L212

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 23 +++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index d68da1eaa7aa..905084c097a9 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -42,6 +42,29 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  		if (sps->bit_depth_luma_minus8 !=3D 0)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SLICE_PARAMS) {
> +		const struct v4l2_ctrl_h264_slice_params *slice =3D ctrl->p_new.p_h264=
_slice_params;
> +		unsigned int i;
> +
> +		if (slice->num_ref_idx_l0_active_minus1 >=3D
> +		    V4L2_H264_NUM_DPB_ENTRIES)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i <=3D slice->num_ref_idx_l0_active_minus1; i++)
> +			if (slice->ref_pic_list0[i].index >=3D
> +			    V4L2_H264_NUM_DPB_ENTRIES)
> +				return -EINVAL;
> +
> +		if (slice->slice_type =3D=3D V4L2_H264_SLICE_TYPE_B) {
> +			if (slice->num_ref_idx_l1_active_minus1 >=3D
> +			    V4L2_H264_NUM_DPB_ENTRIES)
> +				return -EINVAL;
> +
> +			for (i =3D 0; i <=3D slice->num_ref_idx_l1_active_minus1; i++)
> +				if (slice->ref_pic_list1[i].index >=3D
> +				    V4L2_H264_NUM_DPB_ENTRIES)
> +					return -EINVAL;
> +		}
>  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
>  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
>  		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_c=
tx, hdl);
>=20




