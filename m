Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5991235E1C7
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102178; cv=none; b=LXovefFIhr77iRyUwGk4g+Kx0GYpENj0Q/MPqQicXWIpFKyxHIVIrorvYGivxxmx2pcT2mpV2qgv8djSa8GoWEQUZ5qmhFDsOQwoajhk7/Via9uMc7gZgDEtjc2l2+ROhLlwEpaIcEvWwCUxwOnEPaIsaL8xrhGLJ31DTswEFjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102178; c=relaxed/simple;
	bh=CIqhjTj5g+FmnxxYgWebFLD3RznaSfSpLF7RyRT5j2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JovBhrP1HvEiOPvzLkIQj2evw75CM75rDxQBA7oMAqVLVYIA2Pql1ZwY/u1PmSEh6Q92iHKNZ8QVcusJJ/e7jqLtCj3198LEQZw6GgzeK54baxeT7ZfCPrU8YWXvpP0QAqYwyj1geTvTEPePHDJxgjb3gZ3DdSWl85JkglbD9dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMM1K0RW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMM1K0RW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360BDC2BCB7;
	Mon, 18 May 2026 11:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779102177;
	bh=CIqhjTj5g+FmnxxYgWebFLD3RznaSfSpLF7RyRT5j2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hMM1K0RWeI8cbacBpvN4tPlybaYYlYhuMOBKo7okaaggaUxvQcfbmRdQFzdiyC4ZG
	 6bQEPqyZzxVwqd3NFUVKwqjrObBecmN7S/84Juhz2acBHVikkEk2YyrDSF3b/47eRw
	 pYesDZNog+Is+HbhRKSqI7nQxICpkqtJFp0jBIN+zJz8vNzCOknD1TJoNqS60f3gGi
	 eVpSCWPW398QRgk91pDR9pxupQfCmRfSQuTmGwFBNmhHOZdLVaunjsmc3Lf8cd4Td/
	 I3BovOyXLcwHR/XoXUCvHV2BzZtO6snykYsRjNJMmM3LmWK+xXea3MxQV5OvQw+O0Q
	 XeeBMSUIyPStg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/16] media: sun6i-isp: Add support for MC-centric
 format enumeration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Kocialkowski" <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260518102451.417971-16-paulk@sys-base.io>
References: <20260518102451.417971-16-paulk@sys-base.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:02:50 +0000
Message-Id: <20260518110251.360BDC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing mbus_code validation in sun6i_isp_params_enum_fmt when V=
4L2_CAP_IO_MC is enabled.
--

commit 1a4894a83da0c694f7055ec896e27ceb3fb1ad43
Author: Paul Kocialkowski <paulk@sys-base.io>

media: sun6i-isp: Add support for MC-centric format enumeration

This commit adds MC-centric format enumeration support to the sun6i-isp
driver by setting the V4L2_CAP_IO_MC capability on the capture and params
video nodes. It also updates the capture format enumeration to validate
the provided mbus code.

> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index 0cc48e2bc8c61..2622e5a078176 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -531,7 +531,8 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *i=
sp_dev)
> =20
>  	strscpy(video_dev->name, SUN6I_ISP_PARAMS_NAME,
>  		sizeof(video_dev->name));
> -	video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
> +	video_dev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
> +				 V4L2_CAP_IO_MC;

The commit message mentions that the params video node does not care about
the mbus format, but with V4L2_CAP_IO_MC enabled here, does this allow
sun6i_isp_params_enum_fmt() to return success for invalid mbus codes?

According to the V4L2 specification for MC-centric devices, if the
mbus_code field in struct v4l2_fmtdesc is non-zero during the
VIDIOC_ENUM_FMT ioctl, the driver must restrict the enumerated formats
to those supported for the given media bus code, and return -EINVAL if
the code is unsupported.

By ignoring the mbus_code in the params node entirely, it appears userspace
could query completely arbitrary values and still receive a 0 (success)
return code. This incorrectly informs userspace that the format is
supported in combination with any given mbus_code.

Should sun6i_isp_params_enum_fmt() be updated to return -EINVAL if a
non-zero mbus_code is provided, similar to the check added in
sun6i_isp_capture_enum_fmt()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518102451.4179=
71-1-paulk@sys-base.io?part=3D15
