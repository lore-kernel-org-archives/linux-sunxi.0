Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C4E8F58
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500814; cv=none; b=cm2Aa+K4cZkoGGMpk2FOC3I3lfQQPd5f9+8YFYl/wuOE331vCFhKNdCYIw5I9pxJvjNtNBb8ErZRcL1kAmtmVJ34rloUoc8eSYp3qDSSV4QREQw8NPoY8qf7hJKSv22zk57sUNWhXVc2qY34Ms1sNc/iTgtF2nh4SfvLfTOIoy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500814; c=relaxed/simple;
	bh=UDwTz3NjkSUIxb/FAonWmIRVyeFImDM2LeNU/2yGzRA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YHjnSeTdN0KrHg7wSct7C36k8xNbDtoJRneCCOsMzHmvsFo8c2ANGhiG0u1i87m506nqnmZJHhYkKii7Opygb2KFKk5drQhRRC5O8zg9UDvW+a4sMatoVTAi4cNxKrsczARne5pB+pYcrLcBg0hSTedWPURjWX4hUTh/tVkypLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DC8F1063;
	Thu, 24 Apr 2025 06:20:07 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A2CC3F66E;
	Thu, 24 Apr 2025 06:20:09 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:20:06 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424142006.021d6ab4@donnerap.manchester.arm.com>
In-Reply-To: <6e9c003e-2a38-43a7-8474-286bdb6306a0@lunn.ch>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
	<aa38baed-f528-4650-9e06-e7a76c25ec89@lunn.ch>
	<20250424014120.0d66bd85@minigeek.lan>
	<20250424100514-GYA48784@gentoo>
	<6e9c003e-2a38-43a7-8474-286bdb6306a0@lunn.ch>
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

On Thu, 24 Apr 2025 14:19:59 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

Hi Andrew,

> > I'd not bother to try other combinations, and just stick to vendor's
> > settings  
> 
> Vendors get stuff wrong all the time. Just because it works does not
> mean it is correct. And RGMII delays are very frequently wrong because
> there are multiple ways to get a link which works, but don't follow
> the DT binding.

Speaking of which: do you know of a good method to verify the delay
timing? Is there *something* which is sensitive to those timings and which
can be easily checked and qualified?
I just tried iperf3 yesterday, but didn't spot any real change in the
numbers when toying with those delay values.
As mentioned in the other email, we can easily hack the values at runtime,
so if there is a way to get some "quality" value, this could even be
automated.

Thanks,
Andre
