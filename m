Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737412C85
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 21:08:14 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E5DF53F19F
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 20:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1636577953;
	bh=P+Nho+ki2LNnF+z5T6yF3YV5rjwFtt7WzG12jDF4dsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=PoWcKgemmp4mwhp2l4lmBCLkfZ3SpmzdyLjyPKoq80G8cA4mpgErrP18eybxOHb2Y
	 vXQJByIsMC352jNcdfyj4UXP/EzidocHV1tLpiTLs6VxYp7niL9p/dWQp8EFGsJDDG
	 OcSNPVPBeUCUtoidSyQMmVCVy9X8PntZ3/eZvkX5sfrjHJsMTol5AXTL2ccCMWqJ1C
	 Z/I7dUJi0V1y6CBPevv00pDBm83iX0IVs1vU6yj31toquHavUrL78zUue1Sn5s5jiB
	 q/ofVCbyE53EENrbrBLH5NmLLeDpEwWw2EJuWhu0ND3cOYFDjDw6cpAITPQJH9ie4f
	 cgtYx+BqZdHPA==
Received: by mail-wm1-f70.google.com with SMTP id g80-20020a1c2053000000b003331a764709so3682725wmg.2
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 12:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P+Nho+ki2LNnF+z5T6yF3YV5rjwFtt7WzG12jDF4dsQ=;
        b=y9eEOrjKA7zfUqImJ6N5bbSakKPsLiSYUCdM5nNAhcpFRZXJZMe8vLqi+Yz2EuxCM/
         awekVuaNqUKynYCED5JlgRiGVHnZhPLXmn785wFTj7GrOJajeZtwzhGhG1e2++lya2MZ
         R1nUIhR/kD1qjUsw9BXC2kFkZCpCvhURSPcB66gEojJGHH5KNhfbLzY2GEYzJ0gegDmC
         xc7ZEUT8fbAoBs4qLghH7wKpmO1+7JWwATppOLlgCgGKiKg73Zs/CPee7ciLR5mUQ8gz
         8T5ex7arCA3yhcbwdTjFKsbp0kPxQ41lYR11+R1OdRAaXLkZdzE+1NkVjW3SR9lp+LBY
         jzdw==
X-Gm-Message-State: AOAM530Kw/w8Vp6LPiypF12EVZ0ytd61AYmiAlU6rHoiVxPGp8DvUeHM
	rUPFUmRbGtn2lo4frwW73J9anbsFqfsZWHwJFInkrZNRHUJg0yXQ4Szd6Yol/p8duoA2+PVmPcQ
	FgyHzPP3YUt5HL1twuJUqdFHPbDxCkBCZMSdEHy6h
X-Received: by 2002:a05:600c:3ba5:: with SMTP id n37mr19578284wms.168.1636577953645;
        Wed, 10 Nov 2021 12:59:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLJHnsOZuTf+aL8JhL6+gjqjmAJZK3dhaD/eMDDeZcBx5gE/F7it7rUONGruI4eCpPc6f/qg==
X-Received: by 2002:a05:600c:3ba5:: with SMTP id n37mr19578262wms.168.1636577953438;
        Wed, 10 Nov 2021 12:59:13 -0800 (PST)
Received: from [192.168.123.35] (ip-88-152-144-157.hsi03.unitymediagroup.de. [88.152.144.157])
        by smtp.gmail.com with ESMTPSA id r8sm1249223wrz.43.2021.11.10.12.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Nov 2021 12:59:13 -0800 (PST)
Message-ID: <c0c23137-ecc6-b424-bb8f-47f182c06b8c@canonical.com>
Date: Wed, 10 Nov 2021 21:59:11 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: Pull request: u-boot-sunxi/master fix for 2022.01
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Simon Glass <sjg@chromium.org>,
 Samuel Holland <samuel@sholland.org>
References: <20211110015114.32585-1-andre.przywara@arm.com>
 <20211110191111.GI24579@bill-the-cat>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20211110191111.GI24579@bill-the-cat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/21 20:11, Tom Rini wrote:
> On Wed, Nov 10, 2021 at 01:51:14AM +0000, Andre Przywara wrote:
> 
>> Hi Tom,
>>
>> as discussed, please pull this patch to disable the watchdog on sunxi
>> boards by default. The watchdog only got enabled in this release cycle,
>> and its short period breaks actual users (Debian installer).

The SUNXI watchdog is not disabled (CONFIG_WDT_SUNXI=y).
It is not started automatically (CONFIG_WATCHDOG_AUTOSTART=n).

86798ee0c148 ("watchdog: don't autostart watchdog on Sunxi boards")

Thanks for merging.

Best regards

Heinrich

>>
>> Thanks,
>> Andre
>>
>> ========================
>> The following changes since commit e8e9c6f48400989c5fc54467576f8d535bd713e6:
>>
>>    Merge https://source.denx.de/u-boot/custodians/u-boot-samsung (2021-11-09 15:05:33 -0500)
>>
>> are available in the Git repository at:
>>
>>    https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>>
>> for you to fetch changes up to 86798ee0c148db248d8e3e9b6395bbe9e24d9149:
>>
>>    watchdog: don't autostart watchdog on Sunxi boards (2021-11-10 01:38:07 +0000)
>>
> 
> Applied to u-boot/master, thanks!
> 
