Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A0070
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 01:51:11 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210525014211epoutp0247ae0c88a2fce8ecb8306cdc5e98b99d~CK8LWZydS2992129921epoutp02s
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 01:42:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210525014211epoutp0247ae0c88a2fce8ecb8306cdc5e98b99d~CK8LWZydS2992129921epoutp02s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1621906931;
	bh=XhbSqQYu/tuwnLKT8qwzcKYoRjjX6b4PvrIfiiHkHjI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=WXaYQqM3t/nHXp82e/paZeNrzdcdSP1x2gT/TWaadJupeE2PvWM7gY9P1//VCpJmx
	 Zqm2QvvgIXy9427kStrLIPX4/RhZcZLg9dDQdNOzJw3bhWMo7Ii8YTiO0bCCY+QCIB
	 YtUYM5xeju36jNtDgihiEVgBWhDW4nFJyT7AV21U=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20210525014211epcas1p382f6a92ecb3238bfc9e174d79512c98f~CK8LH4XG83016230162epcas1p3B;
	Tue, 25 May 2021 01:42:11 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Fpxds12J1z4x9Q9; Tue, 25 May
	2021 01:42:09 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	71.85.09824.EE55CA06; Tue, 25 May 2021 10:42:06 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20210525014205epcas1p3e8928a8f0824428b6f793e5f8baaaac8~CK8FcRIRx1849218492epcas1p3t;
	Tue, 25 May 2021 01:42:05 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20210525014205epsmtrp2cc26b101b67367039b71d30cc783da94~CK8FbdNna2569425694epsmtrp2W;
	Tue, 25 May 2021 01:42:05 +0000 (GMT)
X-AuditID: b6c32a37-04bff70000002660-15-60ac55eef833
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.04.08163.DE55CA06; Tue, 25 May 2021 10:42:05 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20210525014205epsmtip1d20441b8ff5d5736de9647204785b3c0~CK8FPK-GL0362703627epsmtip1f;
	Tue, 25 May 2021 01:42:05 +0000 (GMT)
Subject: Re: [PATCH 1/8] mmc: sunxi: Avoid #ifdefs in delay and width setup
To: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
	<jagan@amarulasolutions.com>, Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
	Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <98b79b34-8fc0-7e7e-f242-b3f6801a8c74@samsung.com>
Date: Tue, 25 May 2021 10:42:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210524233029.16417-2-andre.przywara@arm.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNJsWRmVeSWpSXmKPExsWy7bCmru670DUJBlufcVismPeT0eLLpgls
	Fs/nr2O0mLJvF5vFx58nGS1+rPrCavH8USebxdu9newOHB5rP95n9Vgzbw2jx85Zd9k9zt7Z
	wejxYvNMRo83XZPZPTa+28Hk8errXMYAjqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwND
	XUNLC3MlhbzE3FRbJRefAF23zByg25QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5
	BZYFesWJucWleel6yfm5VoYGBkamQIUJ2RmrHlxkLNgsUDH59U7GBsYLPF2MnBwSAiYSm/78
	ZwSxhQR2MEqs3mLbxcgFZH9ilJi/8RsrhPOZUaKlfQILTMf/de/YIBK7GCUWz53LDNH+nlHi
	0R0nEFtYwFtiypKbrCC2iECxxNHb31lAGpgF1jJKtB5aywSSYBPQkdj+7TiQzcHBK2An8eWC
	I0iYRUBV4uCde2AlogKREjufvmQHsXkFBCVOznwCdgSngI3EwX0dYHFmAXGJW0/mM0HY8hLb
	385hBtklIbCFQ6LxwD9mkPkSAi4SG9u0IB4Qlnh1fAs7hC0l8fndXjYIu1piV/MZqN4ORolb
	25qYIBLGEvuXTga7k1lAU2L9Ln2IsKLEzt9zGSH28km8+9rDCrGKV6KjTQiiREXi0uuXTDCr
	7j75zwphe0hcuPSedQKj4iwkn81C8s0sJN/MQli8gJFlFaNYakFxbnpqsWGBMXJcb2IEp1ot
	8x2M095+0DvEyMTBeIhRgoNZSYT3b9/KBCHelMTKqtSi/Pii0pzU4kOMpsCwnsgsJZqcD0z2
	eSXxhqZGxsbGFiaGZqaGhkrivOnO1QlCAumJJanZqakFqUUwfUwcnFINTAsff76zbteXzPrI
	R8fcC0RUZJe+Vp5/yebxhF/rrIKXn0vb5LUq6YvGcomNzqsmzM66WiL2ba1c8omehRE77PR+
	2S56NNliTuad6IRJhVuzGgQf/xBdxH+M8cOcIyUnJ1s18+wInvn64+3+rTnF3jz2QvHpeXtq
	YlLrZi/6wlDKlqp3/PYvt65V0t9ZCzK7mx4YbemxfC/yTGbrBG/hP3veBATObcg8l7334FrX
	7uDv9pl+wV11xevPrJDzaX6kGMxzcuv8eROdV3Qv9nt17hTP5X+JFuE7pp1Rm6Z5qUAmYhJ3
	6ZsVnz+5d2tNNRFi2vkmfvMkjmP7md7tdQozeLD38tad9iLJp4RrDdmP2S1UYinOSDTUYi4q
	TgQAv2MPMT4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42LZdlhJTvdt6JoEg7UfuS1WzPvJaPFl0wQ2
	i+fz1zFaTNm3i83i48+TjBY/Vn1htXj+qJPN4u3eTnYHDo+1H++zeqyZt4bRY+esu+weZ+/s
	YPR4sXkmo8ebrsnsHhvf7WDyePV1LmMARxSXTUpqTmZZapG+XQJXxqoHFxkLNgtUTH69k7GB
	8QJPFyMnh4SAicT/de/Yuhi5OIQEdjBKvL/7ih0iISXx+elUoAQHkC0scfhwMUTNW0aJsz9e
	MoLUCAt4S0xZcpMVxBYRKJa4/PU1C0gRs8BaRomZh7YzQ3QcZJT40DiJCaSKTUBHYvu340wg
	U3kF7CS+XHAECbMIqEocvHMPLCwqECmxc4clSJhXQFDi5MwnLCA2p4CNxMF9HWC3MQuoS/yZ
	d4kZwhaXuPVkPhOELS+x/e0c5gmMQrOQtM9C0jILScssJC0LGFlWMUqmFhTnpucWGxYY5aWW
	6xUn5haX5qXrJefnbmIEx5eW1g7GPas+6B1iZOJgPMQowcGsJML7t29lghBvSmJlVWpRfnxR
	aU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1MyW6vI0UZJGNaDQ/XKlTXpvT9
	mL1GdN31uM+ur6fO3NSZ+PGaRYTgyl0/E/6cFpLx87/EFi35qXFy16s/JpPOLGyYlmVbOcn2
	T7SXtHT9xc9zNryPWOVaXX1cN2i72+xuUavtNumdIpvO6Ma9tH+/9vQh8xohswWB1Y2nPv6N
	LXl473SL5nZfK7P4J5+vW/9Mu2Fw9uvSC9dD/7LJNJkpyjsb+y7wuzjfuupGGVuw/OI56/9r
	MnQ9Yhc9f95tzcKO9Mq5p1Z2Mi77eYjr08EZO42SOMqD5q7UefvbpW/Dq9TVupkRV1g+Od4V
	D5eadj7iRvARK9ZPKy5zfdsYoSU3meVRwHlu5pSk0Kw/MisDlFiKMxINtZiLihMBVx++nh4D
	AAA=
X-CMS-MailID: 20210525014205epcas1p3e8928a8f0824428b6f793e5f8baaaac8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210524233124epcas1p1459b23cce255fb4a9318fd32b7294e5e
References: <20210524233029.16417-1-andre.przywara@arm.com>
	<CGME20210524233124epcas1p1459b23cce255fb4a9318fd32b7294e5e@epcas1p1.samsung.com>
	<20210524233029.16417-2-andre.przywara@arm.com>

On 5/25/21 8:30 AM, Andre Przywara wrote:
> The delay and bus-width setup are slightly different across the
> Allwinner SoC generations, and we covered this so far with some
> preprocessor conditionals.
> 
> Use the more readable IS_ENABLE() instead.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
>  drivers/mmc/sunxi_mmc.c | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 3503ccdb2ee..87b79fcf5ef 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -156,23 +156,19 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
>  	} else if (hz <= 25000000) {
>  		oclk_dly = 0;
>  		sclk_dly = 5;
> -#ifdef CONFIG_MACH_SUN9I
> -	} else if (hz <= 52000000) {
> -		oclk_dly = 5;
> -		sclk_dly = 4;
> -	} else {
> -		/* hz > 52000000 */
> -		oclk_dly = 2;
> -		sclk_dly = 4;
> -#else
> -	} else if (hz <= 52000000) {
> -		oclk_dly = 3;
> -		sclk_dly = 4;
>  	} else {
> -		/* hz > 52000000 */
> -		oclk_dly = 1;
> +		if (IS_ENABLED(CONFIG_MACH_SUN9I)) {
> +			if (hz <= 52000000)
> +				oclk_dly = 5;
> +			else
> +				oclk_dly = 2;
> +		} else {
> +			if (hz <= 52000000)
> +				oclk_dly = 3;
> +			else
> +				oclk_dly = 1;
> +		}
>  		sclk_dly = 4;
> -#endif
>  	}
>  
>  	if (new_mode) {
> @@ -521,10 +517,11 @@ struct mmc *sunxi_mmc_init(int sdc_no)
>  
>  	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34;
>  	cfg->host_caps = MMC_MODE_4BIT;
> -#if defined(CONFIG_MACH_SUN50I) || defined(CONFIG_MACH_SUN8I) || defined(CONFIG_SUN50I_GEN_H6)
> -	if (sdc_no == 2)
> +
> +	if ((IS_ENABLED(CONFIG_MACH_SUN50I) || IS_ENABLED(CONFIG_MACH_SUN8I) ||
> +	    IS_ENABLED(CONFIG_SUN50I_GEN_H6)) && (sdc_no == 2))
>  		cfg->host_caps = MMC_MODE_8BIT;
> -#endif
> +
>  	cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
>  	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
>  
> 

