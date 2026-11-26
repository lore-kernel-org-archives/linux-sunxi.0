Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681288;
	b=hWDBX1QC0hwbZujK8S4eqX0J6pKnAvz/IE9M2lxzZPucDUaoxvC69rLQcG8m1k8/B8ZR
	 VX6KftfsNyIyLGDcnakjYLpfvVRz1ozJP69MCaTfq2VqJqBf5DEbI/guTiQ4TsBLLVd0S
	 w+76+zd3/4/UgvCDve4TAIVDAVrhxoZgyAtbIFa5t/zBH3vuccJ1lmPXNAYapzSRYYBsu
	 Yb9wozy5F62euYC4B5CEJAZOA6p2X7r56mJcrJEefqfso0vSDSbhQj1GS2+Mmy0nNJztf
	 Dr9TyIeaj2xkk0mMRfVOe2EtcH18Th6Mb7hiUTSpZyrggFRMJRrrDaRPHNrW6lMhofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=;
	b=I45ECRknOC+RJVAJEjc3FnVKYDLe08OM0lX9ipUyi48qBigoBfEbF6hUrdkUMRDUen+6
	 um/sDm92Ni0vzynQd8up7IpDuGTJKsre3TswEd15yINLzpEjbRRphStNJZG+FlqeZSqkr
	 kIVtwaCK86lGLgxfp0A05Y8Iv+69eUSnd2Zbw1DWDSPzDmekaywekWdTNsdYHY3RZERB4
	 GYrPmkeNL+oB30YZMG6CaahUxIgTPV9leN3L+YY3+E9miJijbgDV3ZkbIp2ZHV+zeGRY1
	 Vf38YCSS1X8DKALSJlswLweLAfUNG1VSyS00dI/QPjY93HouLnyj5fJztgUxPnzloJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VT5YFz80;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80298606A32A
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 08:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80298606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VT5YFz80
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38431138772so8758278eec.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681288; x=1796286088; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=;
        b=VT5YFz80FVLcnnW0ORY4nJEdSA/8QL4UtGdVPvyCchP2Ipb+Kurqj8CDRBNcR2t0bs
         vHOXjEAjMXk85p1vluLpbGy+IlUOMLfWCe+9FvyRA2e/OiQ7sOCvCvBe/kVd+pKAEvr2
         hFMTw0oKO4UsDHu9mQzqbzMlwmNwjipgMxqUy91JLhm5Qf+vRA5EVMtpaZcVhOc3Q0ZP
         tJIHfBKMq6169+3x/9VE3V910YLgtpk6o9gzfHKfCT6q47pjjML9l0vJKPoYAm70dzth
         lYCrI15reGeacGPf9yep0oT1oovUtfIqw+ikSoQsQYppVY+ad1TXna/KU0OES2wjh80x
         0fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681288; x=1796286088;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=;
        b=OkLTfJDqtJHbf9kNRUCJtuwMgkg3zGvBIKi1YhvbZobA4QHoIEz89PDWCJoQ42sLL6
         EvStJ7Y25XIVIO6k5yMNIZFApD0vyQZMhYuH0F4tp5QPOLrdwZPl7b6KDgc3yBBr5+Ug
         nix76JwSAbR6jXxiu1z0na/wVJgrBWrX1I6tRrJSARTAszvYFWSlr4n57lRbKEdVlB+F
         VDk2P9AoZKQEGb2Spv78inakWIW4vYPWmRe1hVSdE2VUZ/4IJHKv8+lauLfCmkLOLt1Y
         B+T8UIvNpQ3mBSgAqcoGhNmoZY94oZHraBt99BvMhuMZINW/fBkaJb8wNiHIPgES7w4G
         Rtrw==
X-Forwarded-Encrypted: i=1; AL+hErEAt4xC/qSSq6erf5gh72oqOSyySLnzMGq67aIrtuW9H6217iVWkP/Ocs4OKXcl/uR25iyXCQ1c4vUdPA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9U0zWxKmwFzDM5VSOyUSWV3D3aatETHzDA0ShoIi8YNT2sC5RW
	lo3llNSkDd+59Q+sid7E/B30ZGDnHdFKwltFY+JzY7ywJmLxVW5KEY3F
X-Gm-Gg: AZFdTZf8S8MbfwGIRwCITNuP8TJzv7fTjYjmfIxwZo2lfBzv4B9hUR7l3uWR4lqHYze
	5orXh6NkCUmIaCc1m/c60kRDrJEO0ITHGxMzxsLCYW32K5BaXoOhMdFWQVaKPGcXlzHK2/dmFUJ
	2iBSyDiCAO3rZJ199KbwyRrXRy6C1qg+7JHS/ZS94j+nSs7aAdw2MFtLhto7m5PO1M4KjWgChbe
	7tvbpWqi/DRnT+w6gXMIDyND2VqJ/kGJCgMsn2U7+uVCoaajz21djXBgSdaKgoTiGx0yIE8Ohji
	J+L0w3rNE5qzN/hxmiSEpJkdsTCfpczo21i605QBJ+XBZf4qGuWeboS7/pZJKnNe0wLVcIf2VD6
	e3FJf+HkJG51Xl8SyHBKzu3ZmQRRcB4FK0adDf/mP3TcAkQTK+FbFNG5aDzsprNdIDxIM4jT5w1
	WqbCqaZRMekmYjBTjdQSYKDBunjCO2Bk1DJ5LnlYLx4p/+eX0Af3yeyFVjdoGRfGRtHMcZU6K0K
	5j1q2wWTLPA+jx1ez42/Bgvg3ApGwHKLTXXd+ZpktlBTt/PTsiYMCoKy9atNTFnTzItVJtealOs
	pzh+R/w1Gx4xMdZlFedvTTgJkWw3ZvPw3JzUkg5aD1exHYwtCIq5gI640EyYuIzZXHoDqw==
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr31004036eec.21.1795681287254;
        Thu, 26 Nov 2026 00:21:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm68602910eec.26.2026.11.26.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:21:26 -0800 (PST)
Date: Thu, 26 Nov 2026 00:21:25 -0800
Message-ID: <8497d7101dc7524be91edbaa5a9face5@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Prasanth R <ragaprasanth@gmail.com>
Cc: linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-pm@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	driver-core@lists.linux.dev
Subject: Re: [PATCH 0/3] Input: clear the wake IRQ on unbind
In-Reply-To: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
References: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Prasanth,

On Wed, Nov 25, 2026 at 04:21:21PM +0900, Prasanth R wrote:
> These drivers set a wake IRQ with dev_pm_set_wake_irq() and never clear
> it. After unbind and bind, dev_pm_set_wake_irq() warns "wake irq already
> initialized" and returns -EEXIST.
>
> Switch them to the device-managed helpers.

Adding PM and driver core maintainers to the thread.

I wonder why clearing the wake IRQ cannot be done automatically for all
drivers on unbind, for example in device_unbind_cleanup() alongside
pm_runtime_reinit() and dev_pm_set_driver_flags().

The only case I see where a wake IRQ is attached at device registration
time rather than by a bound driver (or bus probe()) is PCI OF WAKE# in
drivers/pci/of.c:pci_configure_wake_irq(). That could be distinguished
by checking dev->driver when attaching the wake IRQ, or via an explicit
flag, so device_unbind_cleanup() only clears driver-bound wake IRQs.

Handling this in the core would save us from having to hunt down and
convert individual drivers to devm_pm_set_wake_irq() across the tree,
and would also fix buses like SPI that set up wake IRQs in probe() but
do not clear them on remove.

Thanks.

-- 
Dmitry
