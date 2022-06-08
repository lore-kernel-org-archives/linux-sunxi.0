Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A907C
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jun 2022 07:34:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 257MH9WA014237;
	Wed, 8 Jun 2022 09:00:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nYvX331WeFyAiDHWDMTVnpcmTodUPoWmcpEmVqlBTGo=;
 b=7CqKEssyNyJ/75qT2kuThKcjoowBuqJSaY6l+iVlfuJF74475S/w8R7soEVPm3NexwD/
 AnHVcOHHXGRYSPaNbGzhjZxj4pQoSo3u82/s0NTkzc8qiO+RUVaRpP+dvEiZaabhWlCl
 +/L9cDlxmTCryWVZNVE1uKAo3fV8gFs0GpPHh3nMbWJlTbR2uTDrhNHYw5Fe+Hvx6oyc
 vNEthzUA20N1yuDCgzikWDWHVK6+A8zy5H5LdvlTsxFfZehf9yO3b6bWtE6MbaLmMXuv
 ymSVWH1/zG1B0NOinSEKBgiSqksoBYWP49EJ+9Ul/ZBQsDDir7TI3JzWwI2KFuFb/qCr Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gj3ctpxjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 09:00:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A762010002A;
	Wed,  8 Jun 2022 09:00:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9697B210F89;
	Wed,  8 Jun 2022 09:00:58 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 8 Jun
 2022 09:00:58 +0200
Message-ID: <98aa3e61-ffbf-73d3-befe-50e1d1fea4ae@foss.st.com>
Date: Wed, 8 Jun 2022 09:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] usb: host: ehci-generic: Make resets and clocks optional
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Tom Rini <trini@konsulko.com>,
        Marek Vasut <marex@denx.de>
CC: <u-boot@lists.denx.de>, <linux-sunxi@lists.linux.dev>
References: <20220607234222.2252-1-andre.przywara@arm.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220607234222.2252-1-andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_02,2022-06-07_02,2022-02-23_01

Hi Andre

On 6/8/22 01:42, Andre Przywara wrote:
> The generic EHCI binding does not *require* resets and clocks
> properties, and indeed for instance the Allwinner A20 SoCs does not
> need or define any resets in its DT.
> 
> Don't easily give up if clk_get_bulk() or reset_get_bulk() return an
> error, but check if that is due to the DT simply having no entries for
> either of them.
> 
> This fixes USB operation on all boards with an Allwinner A10 or A20 SoC,
> which were reporting an error after commit ba96176ab70e2999:
> =======================
> Bus usb@1c14000: ehci_generic usb@1c14000: Failed to get resets (err=-2)
> probe failed, error -2
> =======================
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/usb/host/ehci-generic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-generic.c b/drivers/usb/host/ehci-generic.c
> index 4734af03962..15267e9a05a 100644
> --- a/drivers/usb/host/ehci-generic.c
> +++ b/drivers/usb/host/ehci-generic.c
> @@ -69,7 +69,7 @@ static int ehci_usb_probe(struct udevice *dev)
>  
>  	err = 0;
>  	ret = clk_get_bulk(dev, &priv->clocks);
> -	if (ret) {
> +	if (ret && ret != -ENOENT) {
>  		dev_err(dev, "Failed to get clocks (ret=%d)\n", ret);
>  		return ret;
>  	}
> @@ -81,7 +81,7 @@ static int ehci_usb_probe(struct udevice *dev)
>  	}
>  
>  	err = reset_get_bulk(dev, &priv->resets);
> -	if (err) {
> +	if (ret && ret != -ENOENT) {
>  		dev_err(dev, "Failed to get resets (err=%d)\n", err);
>  		goto clk_err;
>  	}

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
