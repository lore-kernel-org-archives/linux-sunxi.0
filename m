Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BB310A00
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Oct 2023 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqfsXm/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C27C433C7;
	Tue, 31 Oct 2023 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698738492;
	bh=u5OhuMhZzR6JXuvhNC/KDrltMRDZ6tM7BPip6bBNUic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqfsXm/cvPDFyWtJcarQZbOA+Ra2DBzhwm1Xm2FVKaBARc8FW0bceA+lQShI5GQAI
	 WvjnPpUor4s7F/lyhTRkAHt5AsHeHRZerxG/pCNDxIPO1YZKs44wLMAi7eaRxQFpZD
	 S4DKTU1kUJPL40Sg8nJ0O8FOgsqxDZeaX3G4TBJA4fuLZpfjl33gBDnADEz9k0B0Hz
	 Rs1Lhpb+rV3QkBO6PkmIGcwIpXUgMBLonhFQNP99k9P+lWbPVyIM3B2RhcW1Q7YprL
	 EqkLUalBBH/LGoJ8U1q5MNcB9oytnJ8ZiEMHb3KDuCp23uUGUDZRg06TWN0Bky/cxQ
	 S55p9ERkgGmBA==
Date: Tue, 31 Oct 2023 07:48:07 +0000
From: Lee Jones <lee@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND PATCH v7 2/5] leds: sun50i-a100: New driver for the A100
 LED controller
Message-ID: <20231031074807.GQ8909@google.com>
References: <20221231235541.13568-1-samuel@sholland.org>
 <20221231235541.13568-3-samuel@sholland.org>
 <20230316133422.GM9667@google.com>
 <a1adbe50-3400-fd10-1856-8c1d0ed82276@sholland.org>
 <f5468eac-96ec-e8c9-bcc1-9ec219bf3352@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5468eac-96ec-e8c9-bcc1-9ec219bf3352@sholland.org>

On Sun, 29 Oct 2023, Samuel Holland wrote:

> Hi Lee,
> 
> On 10/17/23 19:38, Samuel Holland wrote:
> > On 3/16/23 08:34, Lee Jones wrote:
> >> On Sat, 31 Dec 2022, Samuel Holland wrote:
> >>> +	for_each_available_child_of_node(np, child) {
> >>> +		struct sun50i_a100_ledc_led *led;
> >>> +		struct led_classdev *cdev;
> >>> +		u32 addr, color;
> >>> +
> >>> +		ret = of_property_read_u32(child, "reg", &addr);
> >>> +		if (ret || addr >= count) {
> >>> +			dev_err(dev, "LED 'reg' values must be from 0 to %d\n",
> >>
> >> Doesn't sounds like an address.
> > 
> > The one-wire protocol involves the first LED responding to the first 24
> > bits of the transfer, then forwarding the rest to the next LED. The
> > address is the ordinal position in the chain. So I don't think there is
> > any reason to have gaps in the addresses--the LEDs would still have to
> > physically be there, but you would not be able to control them. That
> > said, the driver doesn't need to enforce this, so I can remove the check.
> 
> There's actually a reason for the driver enforcing that LED addresses
> are contiguous. Removing this check decouples the largest address from
> the number of LED class devices. Unfortunately, there's a register field
> (LEDC_RESET_TIMING_CTRL_REG_LED_NUM) that must be set to the largest
> address for transfers to work correctly.
> 
> This means the driver would need to iterate through the child nodes in
> two passes inside the probe function: first to find the largest reg
> value, and second to actually register the LED class devices.
> 
> Since I don't think having gaps in the addresses is a realistic use
> case, I'd like to keep this restriction for now (with a comment). We
> could always pay the complexity cost later if someone really does want
> to relax this check.

You're replying to a review conducted 7 months ago which in turn was for
a patch submitted nearly a year ago!

Also the review comment was simple - if it's not an address, rename the
variable.

-- 
Lee Jones [李琼斯]
