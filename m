Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853670
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 01:51:24 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210525014216epoutp04e05b9e57959ea60f9db7627bbf7a7c51~CK8Pq2DCP2603326033epoutp04Q
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 01:42:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210525014216epoutp04e05b9e57959ea60f9db7627bbf7a7c51~CK8Pq2DCP2603326033epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1621906936;
	bh=Vco5YWSDCaqz3VcgKPCmPbngfHeS2n5656lHPzvHfvs=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=UXcxwPA+d2XRZO42Dn+pYsg3FJxBjkBlrn2sTSIKfyQG63ipZ0nbSa1lo05olViqz
	 JD82+LVEixkaLk2O7Zop0sogpNcwUm5YWHN+wDgDdZrbdMJw2qh9dNF45mf4c09rWM
	 y3w7RVEWeaTA1ok52XlZBOWVHeHz+MGgKWGUorHs=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20210525014216epcas1p1539b8b8724523c4861536636fcc4d599~CK8Pbcc8Y0163401634epcas1p1K;
	Tue, 25 May 2021 01:42:16 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Fpxdw2kqxz4x9Pr; Tue, 25 May
	2021 01:42:12 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	1A.85.09824.4F55CA06; Tue, 25 May 2021 10:42:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20210525014211epcas1p25d250b5a1f801cc0e83243b5adb248c9~CK8LnQxLb0857808578epcas1p28;
	Tue, 25 May 2021 01:42:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20210525014211epsmtrp290a8a73107b45fc44ea2239833030ee2~CK8LmbObQ2575225752epsmtrp23;
	Tue, 25 May 2021 01:42:11 +0000 (GMT)
X-AuditID: b6c32a37-061ff70000002660-55-60ac55f463c7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	41.C7.08637.3F55CA06; Tue, 25 May 2021 10:42:11 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20210525014211epsmtip16e71f81fcbdd146d07b7e59a178f4b3c~CK8LWlps70331003310epsmtip1_;
	Tue, 25 May 2021 01:42:11 +0000 (GMT)
Subject: Re: [PATCH 4/8] mmc: sunxi: Cleanup "new timing mode" selection
To: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
	<jagan@amarulasolutions.com>, Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
	Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <7d75fbee-22d1-0c1d-7211-fe371f9cbe3c@samsung.com>
Date: Tue, 25 May 2021 10:43:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210524233029.16417-5-andre.przywara@arm.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmnu6X0DUJBssuClusmPeT0eLLpgls
	Fs/nr2O0mLJvF5vFx58nGS1+rPrCavH8USebxdu9newOHB5rP95n9Vgzbw2jx85Zd9k9zt7Z
	wejxYvNMRo83XZPZPTa+28Hk8errXMYAjqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwND
	XUNLC3MlhbzE3FRbJRefAF23zByg25QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5
	BZYFesWJucWleel6yfm5VoYGBkamQIUJ2RkNi7QLzglUvOx9zdrAuJK3i5GTQ0LARGLPgj1s
	XYxcHEICOxglOrZcgXI+MUqs2PebBaRKSOAbo8SVObowHReenGaBKNrLKHHg/A5mCOc9o8TG
	5ltMIFXCAh4STeebwbpFBIoljt7+DtbBLLCWUaL10FqwIjYBHYnt346D2bwCdhKXzqwEs1kE
	VCXmPf/LDmKLCkRK7Hz6kh2iRlDi5MwnYEM5BWwkjh6YyQZiMwuIS9x6Mp8JwpaX2P52DthF
	EgJrOSR27NjBAnG3i8SP9tdQtrDEq+Nb2CFsKYnP7/ayQdjVEruaz0A1dzBK3NrWxASRMJbY
	v3QykM0BtEFTYv0ufYiwosTO33MZIRbzSbz72sMKUiIhwCvR0SYEUaIicen1SyaYVXef/GeF
	sD0k/j1+xjaBUXEWktdmIXlnFpJ3ZiEsXsDIsopRLLWgODc9tdiwwBg5tjcxgtOtlvkOxmlv
	P+gdYmTiYDzEKMHBrCTC+7dvZYIQb0piZVVqUX58UWlOavEhRlNgYE9klhJNzgcm/LySeENT
	I2NjYwsTQzNTQ0Mlcd505+oEIYH0xJLU7NTUgtQimD4mDk6pBiaFaG09t+yXNbfWvBR6w5q/
	6fiRqU6T9m9ZdDBZLPdzSFKa37b2dWEvbNc4qshYFn1bL8q5gkU/Pe6hsX7vUeHHdc+ztixh
	sImbziq32LDkt8AxTydbfrF9Vcf8jeaLrlyZkbHHMn2V7YsVCRfEJrpXdJ9hmnPA9k7YPh6x
	j/oHeGSjSq5KXah9qZu08fTjP9GtdxMdz+3vj79lqfHvq/HK6Xfj81NsnPqy6md4MrqppvU7
	2AnYJ05xkXRQ+Glw5MNG84edCu9S/vLorX7Xs8z3stTdqtPM7Uyv/r7On1azomIHq1rdkQvf
	HdVtb7BzLAr5rZH+erbeo4dmIeK/mnmnTnjuP2H+74bor7en7lBiKc5INNRiLipOBABoywWC
	QAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJTvdz6JoEg6/P9SxWzPvJaPFl0wQ2
	i+fz1zFaTNm3i83i48+TjBY/Vn1htXj+qJPN4u3eTnYHDo+1H++zeqyZt4bRY+esu+weZ+/s
	YPR4sXkmo8ebrsnsHhvf7WDyePV1LmMARxSXTUpqTmZZapG+XQJXRsMi7YJzAhUve1+zNjCu
	5O1i5OSQEDCRuPDkNEsXIxeHkMBuRolN126wQCSkJD4/ncrWxcgBZAtLHD5cDBIWEnjLKDH1
	rjKILSzgIdF0vhmsXESgWOLy19dgc5gF1jJKzDy0nRmi4SCjxKNJPiA2m4COxPZvx5lAbF4B
	O4lLZ1aC2SwCqhLznv9lB9klKhApsXOHJUSJoMTJmU/A5nMK2EgcPTCTDcRmFlCX+DPvEjOE
	LS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxilEwtKM5Nzy02LDDMSy3XK07M
	LS7NS9dLzs/dxAiOLS3NHYzbV33QO8TIxMF4iFGCg1lJhPdv38oEId6UxMqq1KL8+KLSnNTi
	Q4zSHCxK4rwXuk7GCwmkJ5akZqemFqQWwWSZODilGpg4RWzPW/2eKOSsG59yrmvWzq9Pn04x
	O2nr9WxJao7sRdFWU6X1C2WP6UcbNx3rnXd7Nf+aCTde318yYVvyiiszmXoZj5Vc+ME1+QbH
	d6fyJyuVtvoH7hPosVLafDWrOdDmUX7+ied7b57IOGIgueZJ5NKnO87La5dbr9tlrdV+ek9k
	/k5v395LsvXxlSsetq+y+t9fw9O6Up5zU6/unaURWTY5UyR/rWw17u+eyXfV/ZhXgqZ+XXih
	cptOd4RDwKH0n5Nfv1r8c+Ghl/H7NO6xrF57zI1HzH+W4LQPPpo2LIxMD15fmf3aV/f7M4dJ
	k+c8/vNRuHf7UpmsbdnPL556KSex03ePSXiP/f3+New/lFiKMxINtZiLihMBnpmKKxwDAAA=
X-CMS-MailID: 20210525014211epcas1p25d250b5a1f801cc0e83243b5adb248c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210524233154epcas1p4abffabe6e3a3b3dabb62a3dda4724eec
References: <20210524233029.16417-1-andre.przywara@arm.com>
	<CGME20210524233154epcas1p4abffabe6e3a3b3dabb62a3dda4724eec@epcas1p4.samsung.com>
	<20210524233029.16417-5-andre.przywara@arm.com>

On 5/25/21 8:30 AM, Andre Przywara wrote:
> Among the SoCs using the "new timing mode", only the A83T needs to
> explicitly switch to that mode.
> 
> By just defining the symbol for that one odd A83T bit to 0 for any other
> SoCs, we can always OR that in, and save the confusing nested #ifdefs.
> 
> Clean up the also confusing new_mode setting on the way.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
>  drivers/mmc/sunxi_mmc.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index bc68debdad6..33cedb4edba 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -23,6 +23,10 @@
>  #include <asm-generic/gpio.h>
>  #include <linux/delay.h>
>  
> +#ifndef CCM_MMC_CTRL_MODE_SEL_NEW
> +#define CCM_MMC_CTRL_MODE_SEL_NEW	0
> +#endif
> +
>  struct sunxi_mmc_plat {
>  	struct mmc_config cfg;
>  	struct mmc mmc;
> @@ -102,13 +106,10 @@ static int mmc_resource_init(int sdc_no)
>  static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
>  {
>  	unsigned int pll, pll_hz, div, n, oclk_dly, sclk_dly;
> -	bool new_mode = true;
> +	bool new_mode = IS_ENABLED(CONFIG_MMC_SUNXI_HAS_NEW_MODE);
>  	bool calibrate = false;
>  	u32 val = 0;
>  
> -	if (!IS_ENABLED(CONFIG_MMC_SUNXI_HAS_NEW_MODE))
> -		new_mode = false;
> -
>  	/* A83T support new mode only on eMMC */
>  	if (IS_ENABLED(CONFIG_MACH_SUN8I_A83T) && priv->mmc_no != 2)
>  		new_mode = false;
> @@ -176,12 +177,8 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
>  	}
>  
>  	if (new_mode) {
> -#ifdef CONFIG_MMC_SUNXI_HAS_NEW_MODE
> -#ifdef CONFIG_MMC_SUNXI_HAS_MODE_SWITCH
> -		val = CCM_MMC_CTRL_MODE_SEL_NEW;
> -#endif
> +		val |= CCM_MMC_CTRL_MODE_SEL_NEW;
>  		setbits_le32(&priv->reg->ntsr, SUNXI_MMC_NTSR_MODE_SEL_NEW);
> -#endif
>  	} else if (!calibrate) {
>  		/*
>  		 * Use hardcoded delay values if controller doesn't support
> 

