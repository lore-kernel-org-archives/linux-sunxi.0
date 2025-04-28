Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05DE2550D0
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832414; cv=none; b=hXPAxTw6915gJijHuYVtXAvQrY4irQ6v/pprsBOuU2ioeYxa2r8tQJqGdxAOA8gR2QPl0GTzX1grE4fFsPueT0P5+MZCF3j/S3biV87NWr4NFKXlMlg3sqToyYfIxeJ9UuwXdu75f3zNmyt/WthhnHiHfnwDGmgjG4NU3T3k4Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832414; c=relaxed/simple;
	bh=+2qhm637vQUw7DbxYJ4ygSdPfB53CFDELSKmZ66HHVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgtzqn5iOhbAhPWS7PQKNdZZYJBHcnQlY5+dShJ+DS1heyj8S0VAyVO9ej+UcWH1h65TiwL+joFU/iaDqpX/3eL3qDJIYQw4LRrW3THAOaVHLgm2HVC1oac5pZBIievMFIzMj9zTN8yIzd+QSdnhmlXAA319lZCDNVKUOuGX6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0D651595;
	Mon, 28 Apr 2025 02:26:45 -0700 (PDT)
Received: from [10.57.19.90] (unknown [10.57.19.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 308763F673;
	Mon, 28 Apr 2025 02:26:49 -0700 (PDT)
Message-ID: <a7ae0472-5003-40a5-9dfa-7e279b4a611f@arm.com>
Date: Mon, 28 Apr 2025 10:26:47 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/panfrost: enable G31 on H616
To: Philippe Simons <simons.philippe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
 <3aea4181-427f-4859-8a89-54c139775da6@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <3aea4181-427f-4859-8a89-54c139775da6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/04/2025 07:10, Philippe Simons wrote:
> Hi, is there any issue with this serie

Hi,

Sorry, no nothing wrong - it's just slipped through. Thanks for the
reminder. I've applied it to drm-misc-next.

Thanks,
Steve

> Thanks,
> 
> Philippe
> 
> On 4/3/25 07:52, Philippe Simons wrote:
>> Allwinner H616 has a dedicated power domain for its Mali G31.
>>
>> Currently after probe, the GPU is put in runtime suspend which
>> disable the power domain.
>> On first usage of GPU, the power domain enable hangs the system.
>>
>> This series adds the necessary calls to enable the clocks and
>> deasserting the reset line after the power domain enabling and
>> asserting the reset line and disabling the clocks prior to the
>> power domain disabling.
>>
>> This allows to use the Mali GPU on all Allwinner H616
>> boards and devices.
>>
>> Changelog v1 .. v2:
>> - merge flags to a single GPU_PM_RT flag
>> - reorder init/deinit powerup/down sequences according to
>>    Mali manuals.
>> Link to v1:
>> https://lore.kernel.org/linux-sunxi/20250312232319.25712-1-
>> simons.philippe@gmail.com/
>>
>> Philippe Simons (3):
>>    drm/panfrost: Add PM runtime flag
>>    drm/panfrost: add h616 compatible string
>>    drm/panfrost: reorder pd/clk/rst sequence
>>
>>   drivers/gpu/drm/panfrost/panfrost_device.c | 71 ++++++++++++++++------
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  3 +
>>   drivers/gpu/drm/panfrost/panfrost_drv.c    |  8 +++
>>   3 files changed, 63 insertions(+), 19 deletions(-)
>>
>>
>> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
>> prerequisite-patch-id: eb8a11e2b24bb282970d8b8528834dea7ee392cc

