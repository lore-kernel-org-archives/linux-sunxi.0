Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB02FFDDE
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253101; cv=none; b=DoC8Uq0bh4sMAuIpnkVBg2px/ftjArc6I0AJ9h/tuzi9LafKGD+ZuMG2lfK0AF2OnQoaFAgh9VpYDyO5s1KJR7fWdkGModWav5qBFaiQXLb/Hmt8vhSp3oc4hyP7T9hathRKk6IZB2qHNglgxT/gXJpkSr8BLz3OPAThCoqurwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253101; c=relaxed/simple;
	bh=uEdsCzaHopkYv6CEizYbfcQBuyNgQoePrple8BRlyJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssA9NNdJUicLO4TW80jHuSdkVVU0wYeS2jEckg2VqRBA38wrm07cEAU5mcuJ5PLuiFW0cuYYCpNycogqKWFEdrGdK3qmA5Pn+mdAh97vGP/7hZ4mJIVIzsE4FkEumE7KLX2s5F2rHu9waT0fg2ZBO3U6fL3s2QNxheNT9aolH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tti5sdAb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tti5sdAb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so39336525e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Mar 2026 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774253098; x=1774857898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=;
        b=Tti5sdAbIARgLl6eZQauwgvzDJehKxT1A8PtLNvYN3dHPtHGETnb5u8Ea2vWSTYaBy
         MvBU9nJzVd6ymkzup7Wn41+SbaIffv7NV3Mg4Bs2QdC7+/PEqh0PGxlFrS3ZHgbVpFF1
         FEW+N2Zsyvm3TPtrmfqm52WVRulnYFDiWiSewleU3UAK3lbDrQ2L2kyygb7vLXl8Blsg
         wABEBSGamFbfhxIYd+9bF+oeA9NE4QxX1WIdnHkPF83NxtG+sgtnBcN2mhFzAtXgq/2u
         ure7P5PglCGOfB11UJd0uDtDzualr8/anKl/2zMLFyyEUgTyshunwzeSgOH/0TI/Zu9A
         8RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253098; x=1774857898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zocw8FuDkC/LanJ1/4h/CJiS7ZjCNwFDOerkZTo4ZLc=;
        b=rMhbhIOhBzA9t3TLB1wVuU9tvNukjyfA3fr6VZp4rf7+v+OujmFR/HaEqZi87k7j5K
         XOvBn5e5Toyiybxn3ElTXIHmDhl6+KEFmIeEsc7qorQ3lwgsIobYuv2qvXML0xdDoHF7
         OhEynwzlk76UiOrNj6ZfAyiR41XdNqrtQpICD8T6cWLulS5BCCrHMm4Lj/TTEM9BCzxA
         4OYPo8Lr5a5sTZnUNL/HHt2L4ISK8CPrrdTQkrfiwoF+6EDuvNLh9pHsDNcdmH0kyo3p
         1kB/iWGgbwzlYY0b1FgqhH6GTEQSGiauvUP1AuTkKHNj7R4agNvjYNKLwgLOF1OlZkTh
         9eTg==
X-Forwarded-Encrypted: i=1; AJvYcCUXlwwato2qFJQmgDRUYm1kTCNR0LEDdtSBp6+D9wowOm/UEkKlz9tz4qNzvqyoRKJhc8E/nm0ZQNMvUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwD+Q6D5TK+Uwz3iW2f88+r/TTxe4dQ3ZIIL3dTN0V/rtZLEIsb
	oSOIXbtM1x4nTzzYYhi0RVcKs6saB7figPrxtRAM9VvhZgfx8fqdftxP
X-Gm-Gg: ATEYQzxcvGhGNjq0oMUfGFJTYIqYqj0c5kl/PotjyAd0hjxRHJ7WgJPWnx3+PyqlLuK
	Io1J5lSW9i5KorPScjvtnXZdNDfidZ2yQazAdiDRf5vAcKimOoNRidzoh6G5mboH2zZsVY7c2Dx
	kIn9uXcWuuzglaHcYNIKTIrd9o+RvF+ORiCZFGkPMqzohxfXgxImmEDa7k2Bmp3YP9Avqdkf6RJ
	gzvPVPoWqfKgjI1VON7UGf5O+si3NCzkvsmU9SQ2adEf710F+6WpjL7AUkg8lcaZuAHmrl6xnA5
	JFehdBErdn6YFlvEIDfbAocxcJwELcRbi6FyLdadWfKWhUAHq2+JtrrecDNB9ir0H/i1K4MxRPG
	ogknqRKviotcIBp1c27+IQhKF8ev14mbx+d4IK7SoY1oJaH5PHbbHBN/td0V/wO50d3uPzcIhrR
	Ppu477eg9R92Ovo/Ea3mWsyDu3jaFy5j5WFQ9gH1i6h5z8lWckZ0UNvIPY3uCi7PyHafXLi4kjw
	Yt9fb9R
X-Received: by 2002:a05:600c:4e8e:b0:485:3e6c:aacb with SMTP id 5b1f17b1804b1-486feda8c69mr158012695e9.4.1774253098203;
        Mon, 23 Mar 2026 01:04:58 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-69-125.dynamic.telemach.net. [178.79.69.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff19d452sm76320155e9.19.2026.03.23.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:04:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 pengpeng@iscas.ac.cn
Subject: Re: [PATCH 7/7] media: cedrus: validate HEVC slice reference lists
Date: Mon, 23 Mar 2026 09:04:56 +0100
Message-ID: <2402496.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
References: <20260323070314.42949-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 23. marec 2026 ob 08:03:14 Srednjeevropski standardni =C4=
=8Das je Pengpeng Hou napisal(a):
> Cedrus consumes HEVC slice parameters directly from stateless V4L2
> controls, but it does not validate the active reference counts or the
> ref_idx_l0/ref_idx_l1 values before using them in fixed-size 16-entry
> reference arrays. Oversized counts or indices can therefore walk past
> the end of those arrays in the HEVC decode path.
>=20
> Reject HEVC slice controls whose active reference counts or reference
> indices exceed V4L2_HEVC_DPB_ENTRIES_NUM_MAX.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

There is nothing Cedrus specific here. Why not move it to common code?

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff0e..d68da1eaa7aa 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -77,6 +77,28 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
>  			ctx->bit_depth =3D bit_depth;
>  			cedrus_reset_cap_format(ctx);
>  		}
> +	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SLICE_PARAMS) {
> +		const struct v4l2_ctrl_hevc_slice_params *slice =3D ctrl->p_new.p_hevc=
_slice_params;
> +		unsigned int i;
> +
> +		if (slice->num_ref_idx_l0_active_minus1 >=3D
> +		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +			return -EINVAL;
> +
> +		for (i =3D 0; i <=3D slice->num_ref_idx_l0_active_minus1; i++)
> +			if (slice->ref_idx_l0[i] >=3D V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;
> +
> +		if (slice->slice_type =3D=3D V4L2_HEVC_SLICE_TYPE_B) {
> +			if (slice->num_ref_idx_l1_active_minus1 >=3D
> +			    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;
> +
> +			for (i =3D 0; i <=3D slice->num_ref_idx_l1_active_minus1; i++)
> +				if (slice->ref_idx_l1[i] >=3D
> +				    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +					return -EINVAL;
> +		}
>  	}
> =20
>  	return 0;
>=20




