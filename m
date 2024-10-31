Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93018198838
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730374123; cv=none; b=Ro0JXmqPaYp5skmY5/LPkyzbf4fX2HOn6CmNc39Vx30+8ITPmMKWSgFUvCC56BxDWqUIy5ttN2P8RBjvtIYsAUI6SoynMmXjB7Rb2Mp1Yy+S+wwhsmkL1ekRsNUTyjhtc4GN5al0zmRkzTpy0jPHaAMCxQnMRm50pix340Oz7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730374123; c=relaxed/simple;
	bh=zBkLJBcG/MpX6s6lnqkRb2tbZH20eJAv3jIjejsQ9LE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NsDE9gFRMPm3fKuf+23e7JRuRdw4bA07tEphz0+MosRKRyj4oSxk8jEcSeSJmF0KXZtphWvqEl6TCl5rZ+WLT608cc8yARnKSdM3fp2cdVZZPU9RTIgeV4IoGQ+ld6BuGAQYVnyE0aqBEeQaEjVIaCVrZFRf8qAP7UK/qrglRsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BF8A1063;
	Thu, 31 Oct 2024 04:29:08 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12A993F73B;
	Thu, 31 Oct 2024 04:28:36 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:28:28 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>
Subject: Re: [PATCH v1 1/1] phy: sun4i-usb: Remove unused of_gpio.h
Message-ID: <20241031112810.21d00b29@donnerap.manchester.arm.com>
In-Reply-To: <20241031104631.2454581-1-andriy.shevchenko@linux.intel.com>
References: <20241031104631.2454581-1-andriy.shevchenko@linux.intel.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 31 Oct 2024 12:46:31 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> of_gpio.h is deprecated and subject to remove. The drivers in question
> don't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index cd159a71b23c..29b8fd4b9351 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -23,7 +23,6 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> -#include <linux/of_gpio.h>
>  #include <linux/phy/phy.h>
>  #include <linux/phy/phy-sun4i-usb.h>
>  #include <linux/platform_device.h>

