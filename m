Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A50210D
	for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667222840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
	b=MQie/SZdYO152vyIsivc6tTFpwjGq5ITtAWqzBYdqLqKsZSQy8bQ3irC6SlN9kkrhiGQxF
	6v4aagz5ncJiD0DeIHRNUgCwB1bg38WTNj5r1dQCiF659KWg9aex5v7pgHYfhP1crBpabc
	2Yt9Cwcbey7E30TlY8jeZoztnbTNz4s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-yHPfGi_aNe65TcHJsVgu8g-1; Mon, 31 Oct 2022 09:27:17 -0400
X-MC-Unique: yHPfGi_aNe65TcHJsVgu8g-1
Received: by mail-wm1-f72.google.com with SMTP id r6-20020a1c4406000000b003cf4d3b6644so1126472wma.6
        for <linux-sunxi@lists.linux.dev>; Mon, 31 Oct 2022 06:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwqNSS0OJIleR6uoXEXg4AgYpmJqcWP2KGT201SIVMg=;
        b=eRQW9QcC6p4DXmTtldfaXBR8cnRzBWDyV9u5s1k1G85jylPb9pzy8IUWFKa+saLxRp
         EjwliX6kOkVyGUdaPwMoxx0qTb768LBE8j+9K0KxBQjN3M/URd1oI1BMOyPKhZY7/YNi
         867h7wkDyy1MC67hsBXMcPlbKv/IomEoL17S6JZ/5oTTXVpIbm5d0RRp4To5Rq10q+YL
         kk9cvBn0y5LeDiY9aDak3Uue2l0mqwGUmxIt47JXAR24gAtow5OfNoZME6dDADEbRl9Q
         9gYe9pReEtr0RomCDqiriN4xcWO0ngNVtLU46MgeUS++marUfB/QPGtyug2KNEF6xYY/
         sEmQ==
X-Gm-Message-State: ACrzQf0MkKwpUETex31MFG3W+4hB1VEWMi3iS2scAxrLstIDZiXclX6r
	H1yFm2ow6ZSmciADpDiq7vu1qleCqOgOAESTYweR1fl103UCxowHnpGxSbsZVIOuBhoRIITNAK5
	XdYv+8I/RBgM9/smrHfU1orc=
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id z10-20020adfec8a000000b002365b80da83mr7858618wrn.509.1667222835964;
        Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XoYVkE5jE7vlhuKQ/BuqMv6qQj/pE66jVA36/qVXv1WZdIDiMFN0/ixJs2zjwBzGxtBPgyA==
X-Received: by 2002:adf:ec8a:0:b0:236:5b80:da83 with SMTP id z10-20020adfec8a000000b002365b80da83mr7858599wrn.509.1667222835772;
        Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bg37-20020a05600c3ca500b003b477532e66sm25116881wmb.2.2022.10.31.06.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 06:27:15 -0700 (PDT)
Message-ID: <0fe3974c-de66-9eaa-b56a-ed1d07644e4c@redhat.com>
Date: Mon, 31 Oct 2022 14:27:13 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 14/21] drm/fb-helper: Rename
 drm_fb_helper_unregister_fbi() to use _info postfix
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
 <20221024111953.24307-15-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-15-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Rename drm_fb_helper_unregister_fbi() to drm_fb_helper_unregister_info()
> as part of unifying the naming within fbdev helpers. Adapt drivers. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

