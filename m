Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8473220F2
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 11:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667217579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=;
	b=g4jMqAp8hrGRUSmI2Hc4CZvOW0ebl46D4m3RfmyoWgCmf2lrlh3KOdMx6WKwy6Wms7BBpu
	9oFmNSmJ1GNJ0f9OwMeNqOTKRyvkNNdkJOzaaR8FxeKcNNwJnA1wtKNxvfiBk4dKz+vhjf
	7Gxvj1aF3r85fgbNn4qnVwdUj3RxF6Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-aUqcvbNaOUWMGuNBmX20eg-1; Mon, 31 Oct 2022 07:59:38 -0400
X-MC-Unique: aUqcvbNaOUWMGuNBmX20eg-1
Received: by mail-wm1-f69.google.com with SMTP id f62-20020a1c3841000000b003cf6d9aacbbso1000911wma.8
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 04:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypYZqoZTsptEoKYiFoPm/p19rfXtb3oU3pAWnCNe+WI=;
        b=4tGI2u/jXw0SYaJBuQNme5Qmu78ZzIZ4NL/MjoqUTJyFYO5h1Aa/rOS2oHVfcQt86y
         yWLXAoSXkpcwbBrk6wcIwIe4COjtLQoxQwopQ+rHbM9UisoKm3aQ/1zoaPqiH1wGnYGf
         ShQl6gjQP4MKbIW8GuKwcwoUYUiHOax73W+saeZNvERYdGJgsBEKi08yb1HcLUkDv1vH
         zRfiw1tFqAGkJhJATMMwnvL1KD47eIULLnLaN2IQ6lnQUmVHN/zgS7vm4insqzImkawQ
         6hswCIEytnSKzWUGRQ2PNf7oPDYOI55pe93yQ3fB8pvX2XgJYgB2smnd2q1+Pe9yK9pu
         VOQg==
X-Gm-Message-State: ACrzQf3laDVIzdqYtBtNB3E+ATRJGuWeKOmlQJHTahd07Q1Vs9x7HGQ4
	WENlhPhRh/skvu1fWlEWkWNhM85FzrRnBawFnd2G98qpkorOaSw9IyXWEMv9u92f1t3W9y7rb9E
	cRz0bC4kCtSJ5k9ziHSaR7KI=
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id p14-20020a05600c468e00b003c6f510735cmr7602937wmo.179.1667217577119;
        Mon, 31 Oct 2022 04:59:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EBETLSD4MBJxdnzTxR3FGu4hBbX2SQFUCrJloOPK1q2LF0w1HzUkYOXWVOI9w84+cugepvA==
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id p14-20020a05600c468e00b003c6f510735cmr7602924wmo.179.1667217576945;
        Mon, 31 Oct 2022 04:59:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 123-20020a1c1981000000b003c6c182bef9sm7774720wmz.36.2022.10.31.04.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 04:59:36 -0700 (PDT)
Message-ID: <ae69e0c5-05ee-f0ef-a333-53bbaff5c3e8@redhat.com>
Date: Mon, 31 Oct 2022 12:59:34 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 02/21] drm/mcde: Don't set struct drm_driver.lastclose
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.lastclose. It's used to restore the
> fbdev console. But as mcde uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See
> the call to drm_client_dev_restore() in drm_lastclose().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

