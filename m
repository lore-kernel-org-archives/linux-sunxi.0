Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6F177
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Jun 2021 10:34:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15T9CNdD011848;
	Tue, 29 Jun 2021 11:18:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=X80iUh6QaVW3Kbhqm1Aj0gKrTFwcCwrTAiEMB/p3SAE=;
 b=M/Gpy87EawNbKSyujei9NTa2BHd1JzRtJKVCH/vGpuB6iraaPrj9PBwQUVfPYsXuEi4b
 U89GAVJiC3lC/DeWbQZw4SzKasVUu1BcPrrJ7NZxZM/Smb2odqyFeMS6jULMOgYVGCCC
 7shI7zTjLrdvIi8p8jGiR0A6FaS4SklEqli6BK9D/Mj3iOJjHrxGKf+6SCFwQH4pwaNm
 FIfKIo1Zm3wn5NTvQkCPDKPrXkwNoscqO+xFO6IthXTt+0IG3S0BxM/PWWed4gkPPOVt
 ebi8/NeZQMSpte6HtHZ0b399eEymWAv+MRO6617GH2iDTs8JEBlA/XIWEgcBFur5uiNf 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 39fc116d9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jun 2021 11:18:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C74F710002A;
	Tue, 29 Jun 2021 11:18:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D8BF21BF75;
	Tue, 29 Jun 2021 11:18:46 +0200 (CEST)
Received: from lmecxl0951.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 11:18:43 +0200
Subject: Re: [PATCH v4 19/27] drm/stm: Don't set struct drm_device.irq_enabled
To: Thomas Zimmermann <tzimmermann@suse.de>, <daniel@ffwll.ch>,
        <airlied@linux.ie>, <alexander.deucher@amd.com>,
        <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>,
        <james.qian.wang@arm.com>, <liviu.dudau@arm.com>,
        <mihail.atanassov@arm.com>, <brian.starkey@arm.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <inki.dae@samsung.com>, <jy0922.shim@samsung.com>,
        <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
        <krzysztof.kozlowski@canonical.com>, <xinliang.liu@linaro.org>,
        <tiantao6@hisilicon.com>, <john.stultz@linaro.org>,
        <kong.kongxinwei@hisilicon.com>, <puck.chen@hisilicon.com>,
        <laurentiu.palcu@oss.nxp.com>, <l.stach@pengutronix.de>,
        <p.zabel@pengutronix.de>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <linux-imx@nxp.com>, <chunkuang.hu@kernel.org>,
        <matthias.bgg@gmail.com>, <bskeggs@redhat.com>, <tomba@kernel.org>,
        <hjc@rock-chips.com>, <heiko@sntech.de>, <philippe.cornu@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <jyri.sarha@iki.fi>, <emma@anholt.net>,
        <linux-graphics-maintainer@vmware.com>, <zackr@vmware.com>,
        <hyun.kwon@xilinx.com>, <laurent.pinchart@ideasonboard.com>,
        <michal.simek@xilinx.com>, <jani.nikula@linux.intel.com>,
        <rodrigo.vivi@intel.com>, <linux@armlinux.org.uk>,
        <kieran.bingham+renesas@ideasonboard.com>,
        <rodrigosiqueiramelo@gmail.com>, <melissa.srw@gmail.com>,
        <hamohammed.sa@gmail.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <nouveau@lists.freedesktop.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <intel-gfx@lists.freedesktop.org>,
        Daniel
 Vetter <daniel.vetter@ffwll.ch>
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-20-tzimmermann@suse.de>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <1c946098-bf82-4028-1543-ba9e4f960aa3@foss.st.com>
Date: Tue, 29 Jun 2021 11:18:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210625082222.3845-20-tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_05:2021-06-25,2021-06-29 signatures=0

Hello Thomas,
thanks for the patch.

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

Best regards


On 6/25/21 10:22 AM, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in stm.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 08b71248044d..e9c5a52f041a 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1339,9 +1339,6 @@ int ltdc_load(struct drm_device *ddev)
>   		goto err;
>   	}
>   
> -	/* Allow usage of vblank without having to call drm_irq_install */
> -	ddev->irq_enabled = 1;
> -
>   	clk_disable_unprepare(ldev->pixel_clk);
>   
>   	pinctrl_pm_select_sleep_state(ddev->dev);
> 
