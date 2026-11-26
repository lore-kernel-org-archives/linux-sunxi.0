Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718438;
	b=4iIwCdijIjyjkDXD6D9p2tPhn0K2kXS6DUumChngQGBnVnCFufIes4TvDMdji+H3XUym
	 Uej0PIDaNSu3M5JeXCZgNVnwmuXqqdAtuCJdlv3PXNjdamygp8DR7bPPOw5HeKl4soB5q
	 9/JFWwL00DWULfkgc2cYN+e2DJJOQZCG8JVVGoHeeCrO77tF//3B0sKjnU2BKZEAu49E6
	 4o1JzQep7UDyUbgsGgfp5tnHFnPAoWri9jj8dwP7zjhIiFDja6A/1wHiUCIKv4kq9aYZB
	 7zlI0cgutApKXlkoOwD2H/Zb3fCn9PAHp3G13urjv4NGVTBD+L1i1tmO3LpOc/2Q+7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718438;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Yi3Rc4EWaDutAe3vc6sCrNBxUD8m1bZ/uif5GFz3ifA=;
	b=UUUU5uRO7hHEbECdq683VO4G1wrBDwOxIrmhydPi/RIQfw5Wu6KeHJ4Qw7e3B7sju/C5
	 Y+oTZyDjkUznqq1KL0/cSA8LsUBaqfP5/5j6v6HLs34GMj+EFSGR28ggB70GBqOw8HxUB
	 YX7Jl9TjzrO1wKTsEVgbAdxjj5rCTgamRoQqm7iFSBpqIF01iBk0dDgmgeJY5vxMME5jq
	 6pYSl/k03TR2RF+KUKMKolcQmir5hRBT13yxu5KkpbbC0g34xxER+5dpwugMBdEVQH3Wa
	 FztbWD8hlOkxlMI+ZttXlOQOgeoxBtgkp2ZorIl1hWdPoRs34rNaLrXC9Oh0Y+DYUnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EyycId5/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153E606A31C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EyycId5/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F9B1F000C4;
	Thu, 26 Nov 2026 18:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718438;
	bh=Yi3Rc4EWaDutAe3vc6sCrNBxUD8m1bZ/uif5GFz3ifA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EyycId5/PyMxOI2S5UJlV1qj9uWjcE0awPzuNG5M8YqJGOb4QSdHkUYXaKBdlxTM/
	 h7VBBXJF07U7hrtNDg28/oFGDODKYDcl6+mTO/hUkBKdelimQPn93MnAFXz6OO97aL
	 B3YhfUE/rHOqkdhrLg2AEUgu4xhUxvbueoDZhFZdL+Bfdejm2QMRaOaHsQKLfTDA9Z
	 sKrILzDGgppHASDFMzMblTIbslFftzMcnsITv2vm76ypat9PtZ/zv0ChXllXb2e0FR
	 MJyvpF1/609dbPj1e1mqrahJJz+8189eSJVGYtYq8YI0sVbeno7eQBPvbYuznZuYCN
	 84z3aWpxHj/jQ==
Message-ID: <sashiko-outbox-236028@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mmc: sunxi: Distinguish CRC and timeout errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261126182944.3136900-4-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
 <20261126182944.3136900-4-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:40:38 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] mmc: sunxi: non-timeout errors set -ETIMEDOUT in
  sunxi_mmc_finalize_request()
--

commit 91cd8b46121add6c52d6b5bc5490c76bdc44d0e9
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

mmc: sunxi: Distinguish CRC and timeout errors

This commit updates sunxi_mmc_finalize_request() to report CRC, start
bit, and end bit errors as -EILSEQ, timeouts as -ETIMEDOUT, and other
errors as -EIO.

> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index b862df26e1926..c2e84c22d3fad 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -537,13 +537,29 @@ static irqreturn_t sunxi_mmc_finalize_request(struc=
t sunxi_mmc_host *host)
> =20
>  	if (host->int_sum & SDXC_INTERRUPT_ERROR_BIT) {
>  		sunxi_mmc_dump_errinfo(host);
> -		mrq->cmd->error =3D -ETIMEDOUT;
> +
> +		if (host->int_sum &
> +		    (SDXC_RESP_ERROR | SDXC_RESP_CRC_ERROR))
> +			mrq->cmd->error =3D -EILSEQ;
> +		else if (host->int_sum & SDXC_RESP_TIMEOUT)
> +			mrq->cmd->error =3D -ETIMEDOUT;
> =20
>  		if (data) {
> -			data->error =3D -ETIMEDOUT;
> +			if (host->int_sum &
> +			    (SDXC_DATA_CRC_ERROR | SDXC_START_BIT_ERROR |
> +			     SDXC_END_BIT_ERROR))
> +				data->error =3D -EILSEQ;
> +			else if (host->int_sum &
> +				 (SDXC_DATA_TIMEOUT | SDXC_FIFO_RUN_ERROR |
> +				  SDXC_HARD_WARE_LOCKED))
> +				data->error =3D -ETIMEDOUT;
> +
>  			host->manual_stop_mrq =3D mrq;
>  		}
> =20
> +		if (!mrq->cmd->error && (!data || !data->error))
> +			mrq->cmd->error =3D -EIO;

[Severity: Medium]
Should SDXC_FIFO_RUN_ERROR and SDXC_HARD_WARE_LOCKED be reported as -EIO
rather than setting data->error to -ETIMEDOUT?

SDXC_INTERRUPT_ERROR_BIT contains only the nine bits already tested by the
cmd and data branches above:

drivers/mmc/host/sunxi-mmc.c:
#define SDXC_INTERRUPT_ERROR_BIT \
	(SDXC_RESP_ERROR | SDXC_RESP_CRC_ERROR | SDXC_DATA_CRC_ERROR | \
	 SDXC_RESP_TIMEOUT | SDXC_DATA_TIMEOUT | SDXC_FIFO_RUN_ERROR | \
	 SDXC_HARD_WARE_LOCKED | SDXC_START_BIT_ERROR | SDXC_END_BIT_ERROR)

When data is non-NULL, grouping SDXC_FIFO_RUN_ERROR and
SDXC_HARD_WARE_LOCKED with SDXC_DATA_TIMEOUT means a FIFO underrun/overrun
or hardware lock error during a data transfer sets data->error =3D -ETIMEDO=
UT
instead of -EIO, and the !data->error fallback check below can never trigge=
r.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126182944.3136=
900-1-jernej.skrabec@gmail.com?part=3D3
