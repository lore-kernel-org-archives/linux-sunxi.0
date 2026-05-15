Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8AD3BA229
	for <linux-sunxi@lists.linux.dev>; Fri, 15 May 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857269; cv=none; b=KMAVxdY/fjspIdJv05TsQE88J45ydzMOuv1siDl9lAlE9/mHLHQNJk6G0eW3tw+1idRLvHujYcCsYyx/e/1PQlKC24MN0IlFfLg6qsNI9UcS68wyrl9dcx6edBj1nxSwVOUcmmu/8iadTtx1A+tnDIZFVmo5ks/5U4YJMbYkUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857269; c=relaxed/simple;
	bh=XTRhdp7TMeHmI/oeIB0Xfh5FxLIBR8NRhKimvV6406U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=usraI8sR7Ag/Kuv5WG4T4bS+EwbMJMSB5AqGbA5NQ4R15EW5G4WZZmHa86l5DaQWND6KZL7zL01Qh/v0hRwdG/NCjrlyOLtJoLDa7X9DpP8Ww7mUblF7tmhnj+BPwJy33G1Q2qAn5xtCaAb+10yxL4tHJHdrysEKJtKG/QHQWns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geVUwyIG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geVUwyIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF13C2BCB0;
	Fri, 15 May 2026 15:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778857269;
	bh=XTRhdp7TMeHmI/oeIB0Xfh5FxLIBR8NRhKimvV6406U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=geVUwyIGePrk9+fK9+1hKjkV6Y5yn+/5rBO/V8utVk4TicpRMMON8W2Tj86HSChFv
	 KDraFTev0LpiqfyRfO6OcvuMXL1YLFiRYZ10qqLVcTrMRMOzxwkUGkHi6InY6fHHkm
	 z0m4FNKFcryufdsuvODt0TgaDnnMTr6ZBvkEDKwkDlj6NvI28OVMuCw7ufN/314R94
	 QK52I+LpfQ8ZipyvHwVdkup+p7orUV1YAlM7qkmaa+0RvN36k0fkZNRnugRLSjvYUF
	 NWgi4NYF6GHu4+OyD2HVQFWjkA1icniS4Y+kZTj2rgr2J+oMc62ooxmDQ0SpDzjMrF
	 yu6dGH9+KeuCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active
 state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arash Golgol" <arash.golgol@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260515144335.61323-1-arash.golgol@gmail.com>
References: <20260515144335.61323-1-arash.golgol@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 15:01:08 +0000
Message-Id: <20260515150109.6EF13C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The active state lock is leaked in the error path of `pm_runtime_r=
esume_and_get()` within `sun8i_a83t_mipi_csi2_s_stream()`.
--

commit 1aff86a32a5202665d5639183ff47ad585d7b58e
Author: Arash Golgol <arash.golgol@gmail.com>
Subject: media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state

This commit updates the sun8i-a83t-mipi-csi2 driver to use the V4L2 subdev
active state API. This simplifies format storage and replaces the bridge lo=
ck
with the state lock.

> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t=
_mipi_csi2.c
> index dbc51daa4fe37..743bc86bfeabe 100644
> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_c=
si2.c
[ ... ]
> @@ -215,8 +216,12 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4l2=
_subdev *subdev, int on)
>  	unsigned long pixel_rate;
>  	int ret;
> =20
> -	if (!source_subdev)
> -		return -ENODEV;
> +	state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> +
> +	if (!source_subdev) {
> +		ret =3D -ENODEV;
> +		goto unlock;
> +	}
> =20
>  	if (!on) {
>  		v4l2_subdev_call(source_subdev, video, s_stream, 0);

Does this code leak the active state lock if the subsequent runtime PM resu=
me
fails?

Looking at the unmodified code that immediately follows this hunk in
sun8i_a83t_mipi_csi2_s_stream():

	/* Runtime PM */

	ret =3D pm_runtime_resume_and_get(dev);
	if (ret < 0)
		return ret;

Since the state lock is now acquired at the beginning of the function,
if pm_runtime_resume_and_get() returns a negative value, it directly returns
to the caller.

Because it bypasses the "goto unlock" path, the state lock remains acquired,
which could cause a deadlock on any subsequent attempt to access the active
state or start the stream.

Should this error path be updated to "goto unlock" so the lock is properly
released?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515144335.6132=
3-1-arash.golgol@gmail.com?part=3D1
