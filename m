Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E5170
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 01:42:33 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210525014231epoutp04205a3bc2f9dc2812d0eb9aafe8bc91e5~CK8d0S2A02603426034epoutp04Y
	for <linux-sunxi@lists.linux.dev>; Tue, 25 May 2021 01:42:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210525014231epoutp04205a3bc2f9dc2812d0eb9aafe8bc91e5~CK8d0S2A02603426034epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1621906951;
	bh=2Aty8VTRctBdjjMeoEVQ625tSbf52rMhIUxpobpIjwI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=pJZ0dYOxQPiLTkQFiCnShJ3z4Z80bes5FYMVFdV/Uhm/Ammsc9OUDzVsbOxkN4D3z
	 23pRkLyPuxQlcY/qWv5I/KqLewNsu3LX5mPgJAh85A0aGBHryjO+b084S+7B9H6Qi5
	 5p2ly5M+TAOrESsMD6LncwXsmrxtySDh8zUxbdIE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20210525014231epcas1p3544319870f05f51238d23c00ff806397~CK8dhvyhy1849218492epcas1p3W;
	Tue, 25 May 2021 01:42:31 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4FpxfD50Y6z4x9Q2; Tue, 25 May
	2021 01:42:28 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	5D.42.09578.AF55CA06; Tue, 25 May 2021 10:42:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20210525014218epcas1p385db759a85a17667220db11c5a8470f3~CK8RlIwI52295422954epcas1p3h;
	Tue, 25 May 2021 01:42:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20210525014218epsmtrp14fddcfd3d3183eb55469b0dc880b37b5~CK8RkdOPn1715417154epsmtrp1O;
	Tue, 25 May 2021 01:42:18 +0000 (GMT)
X-AuditID: b6c32a35-fb9ff7000000256a-ce-60ac55fa21f0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	23.C7.08637.AF55CA06; Tue, 25 May 2021 10:42:18 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20210525014218epsmtip2c58b51b6be0366a90ce6fb983b594648~CK8RSsaJZ1960219602epsmtip2C;
	Tue, 25 May 2021 01:42:17 +0000 (GMT)
Subject: Re: [PATCH 8/8] mmc: sunxi: Use mmc_of_parse()
To: Andre Przywara <andre.przywara@arm.com>, Jagan Teki
	<jagan@amarulasolutions.com>, Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
	Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
From: Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <2d173c94-b237-1f11-7c62-daa70e7f045f@samsung.com>
Date: Tue, 25 May 2021 10:43:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210524233029.16417-9-andre.przywara@arm.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmru6v0DUJBut+K1ismPeT0eLLpgls
	Fs/nr2O0mLJvF5vFx58nGS1+rPrCavH8USebxdu9newOHB5rP95n9Vgzbw2jx85Zd9k9zt7Z
	wejxYvNMRo83XZPZPTa+28Hk8errXMYAjqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwND
	XUNLC3MlhbzE3FRbJRefAF23zByg25QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5
	BZYFesWJucWleel6yfm5VoYGBkamQIUJ2Rm3nt5jLZgnXTH55zXmBsbjol2MnBwSAiYS6+a0
	snYxcnEICexglNi64wcTSEJI4BOjxLcp/BCJb4wST8/vZoPpuLHrGCNEYi+jxPe1bWwQzntG
	idnvvrF0MXJwCAuYS/y+rgHSICJQLHH09ncWkBpmgbWMEq2H1oKtYBPQkdj+7TiYzStgJ7H5
	2A1mEJtFQFWi5fA+RhBbVCBSYufTl+wQNYISJ2c+YQGxOQVsJJZMmMkKYjMLiEvcejKfCcKW
	l9j+dg4zyDIJgR0cEi+XHmSHONtFYtbl6SwQtrDEq+NboOJSEi/726DsaoldzWegmjsYJW5t
	a2KCSBhL7F86mQnkM2YBTYn1u/QhwooSO3/PZYRYzCfx7msPK0iJhACvREebEESJisSl1y+Z
	YFbdffKfFcL2kJj3ZDvLBEbFWUhem4XknVlI3pmFsHgBI8sqRrHUguLc9NRiwwJD5NjexAhO
	t1qmOxgnvv2gd4iRiYPxEKMEB7OSCO/fvpUJQrwpiZVVqUX58UWlOanFhxhNgYE9kVlKNDkf
	mPDzSuINTY2MjY0tTAzNTA0NlcR5052rE4QE0hNLUrNTUwtSi2D6mDg4pRqYLpYxbjf7vyD2
	3NQtNxj/l3xtZtqy8nhphITQtgwe6V/eFcd3xO59smVO2SzHyUclLHfpNn7+n5Kgzn9DI//B
	e/GVrE45Ez7mHZDfwBWte+PS/q6oT2ob3H13OvtyWeUdn7yrKMLgw+dJG/qt2Scx/GzL7eI9
	3+Nl0BL2YZllQFzoTdYJ31rcnrF1nvF2ur3k8Ulx+913pUUsRQvm7f1bZ1daWKimdIFxo6OP
	p9TzZ+1dl+T+ndpze2XWpm9egty86wx7V3j5+XdvjqlMC3hW/GFSyPNvy2bdj4lZK5Z3uGKy
	C1OvYMEGuQN8bPd3b1j0sO8G2/2XFhVybZdLal/sWxFqV3RV9nObeM2txUuDlViKMxINtZiL
	ihMBTxNc7kAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42LZdlhJXvdX6JoEg2fzOSxWzPvJaPFl0wQ2
	i+fz1zFaTNm3i83i48+TjBY/Vn1htXj+qJPN4u3eTnYHDo+1H++zeqyZt4bRY+esu+weZ+/s
	YPR4sXkmo8ebrsnsHhvf7WDyePV1LmMARxSXTUpqTmZZapG+XQJXxq2n91gL5klXTP55jbmB
	8bhoFyMnh4SAicSNXccYuxi5OIQEdjNK3HjxgB0iISXx+elUti5GDiBbWOLw4WKQsJDAW0aJ
	lun1IGFhAXOJ39c1QMIiAsUSl7++ZgEZwyywllFi5qHtzBAzDzJKTN+8lhmkik1AR2L7t+NM
	IDavgJ3E5mM3wOIsAqoSLYf3MYIMFRWIlNi5wxKiRFDi5MwnLCA2p4CNxJIJM1lBbGYBdYk/
	8y4xQ9jiEreezGeCsOUltr+dwzyBUWgWkvZZSFpmIWmZhaRlASPLKkbJ1ILi3PTcYsMCw7zU
	cr3ixNzi0rx0veT83E2M4OjS0tzBuH3VB71DjEwcjIcYJTiYlUR4//atTBDiTUmsrEotyo8v
	Ks1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qBac7KU82Fi16fEWBiTJl3MmKp
	oYTJlZXxxTozrkec1bE4+1rpmdmh27U3/MT0+iS1a3/PbZW/Etvf6bfTUn9e76OeW9f8eH//
	VVx3X8r9sen+rIyeBxebA6/sXvIr94KI5m5xrcnPfA/MfpJbocj77Ivddtsgu2vL10pHLjrM
	OV12p/K5N1Y/X52Wr/huk3xhxobl5+YG34jfY/BlM/OUOS3ac64IenOfO8W9buaB4BvOVRzz
	9xRv37qBgZHvZk8yo9p6JSdBRddpazds3fX/VtTKTXJqzIss+9LkrF4ei5lzPue19r/nfJMO
	57JMsds7P7FiqVTCB704MbcdF1kP8L2PMVE69PTMhE/zdfdwyIYosRRnJBpqMRcVJwIAPgPy
	vx0DAAA=
X-CMS-MailID: 20210525014218epcas1p385db759a85a17667220db11c5a8470f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210524233236epcas1p29fb3bbd100175db4857e4a6dbaaf0065
References: <20210524233029.16417-1-andre.przywara@arm.com>
	<CGME20210524233236epcas1p29fb3bbd100175db4857e4a6dbaaf0065@epcas1p2.samsung.com>
	<20210524233029.16417-9-andre.przywara@arm.com>

On 5/25/21 8:30 AM, Andre Przywara wrote:
> At the moment the Allwinner MMC driver parses the bus-width and
> non-removable DT properties itself, in the probe() routine.
> 
> There is actually a generic function provided by the MMC framework doing
> this job, also it parses more generic properties like broken-cd and
> advanced transfer modes.
> 
> Drop our own code and call mmc_of_parse() instead, to get all new
> features for free.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung
> ---
>  drivers/mmc/sunxi_mmc.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index 115b519546e..178b8cf106d 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -37,7 +37,6 @@ struct sunxi_mmc_priv {
>  	uint32_t *mclkreg;
>  	unsigned fatal_err;
>  	struct gpio_desc cd_gpio;	/* Change Detect GPIO */
> -	int cd_inverted;		/* Inverted Card Detect */
>  	struct sunxi_mmc *reg;
>  	struct mmc_config cfg;
>  };
> @@ -612,12 +611,21 @@ static int sunxi_mmc_send_cmd(struct udevice *dev, struct mmc_cmd *cmd,
>  
>  static int sunxi_mmc_getcd(struct udevice *dev)
>  {
> +	struct mmc *mmc = mmc_get_mmc_dev(dev);
>  	struct sunxi_mmc_priv *priv = dev_get_priv(dev);
>  
> +	/* If polling, assume that the card is always present. */
> +	if ((mmc->cfg->host_caps & MMC_CAP_NONREMOVABLE) ||
> +	    (mmc->cfg->host_caps & MMC_CAP_NEEDS_POLL))
> +		return 1;
> +
>  	if (dm_gpio_is_valid(&priv->cd_gpio)) {
>  		int cd_state = dm_gpio_get_value(&priv->cd_gpio);
>  
> -		return cd_state ^ priv->cd_inverted;
> +		if (mmc->cfg->host_caps & MMC_CAP_CD_ACTIVE_HIGH)
> +			return !cd_state;
> +		else
> +			return cd_state;
>  	}
>  	return 1;
>  }
> @@ -649,23 +657,21 @@ static int sunxi_mmc_probe(struct udevice *dev)
>  	struct mmc_config *cfg = &plat->cfg;
>  	struct ofnode_phandle_args args;
>  	u32 *ccu_reg;
> -	int bus_width, ret;
> +	int ret;
>  
>  	cfg->name = dev->name;
> -	bus_width = dev_read_u32_default(dev, "bus-width", 1);
>  
>  	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34;
> -	cfg->host_caps = 0;
> -	if (bus_width == 8)
> -		cfg->host_caps |= MMC_MODE_8BIT;
> -	if (bus_width >= 4)
> -		cfg->host_caps |= MMC_MODE_4BIT;
> -	cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
> +	cfg->host_caps = MMC_MODE_HS_52MHz | MMC_MODE_HS;
>  	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
>  
>  	cfg->f_min = 400000;
>  	cfg->f_max = 52000000;
>  
> +	ret = mmc_of_parse(dev, cfg);
> +	if (ret)
> +		return ret;
> +
>  	priv->reg = dev_read_addr_ptr(dev);
>  
>  	/* We don't have a sunxi clock driver so find the clock address here */
> @@ -691,17 +697,13 @@ static int sunxi_mmc_probe(struct udevice *dev)
>  		return ret;
>  
>  	/* This GPIO is optional */
> -	if (!dev_read_bool(dev, "non-removable") &&
> -	    !gpio_request_by_name(dev, "cd-gpios", 0, &priv->cd_gpio,
> +	if (!gpio_request_by_name(dev, "cd-gpios", 0, &priv->cd_gpio,
>  				  GPIOD_IS_IN)) {
>  		int cd_pin = gpio_get_number(&priv->cd_gpio);
>  
>  		sunxi_gpio_set_pull(cd_pin, SUNXI_GPIO_PULL_UP);
>  	}
>  
> -	/* Check if card detect is inverted */
> -	priv->cd_inverted = dev_read_bool(dev, "cd-inverted");
> -
>  	upriv->mmc = &plat->mmc;
>  
>  	/* Reset controller */
> 

