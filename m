Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481D872
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Jun 2021 12:56:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B284610CA;
	Sun, 20 Jun 2021 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624193812;
	bh=bWaVnm+peFovnHMu18RwWDuf3L6KT66p404kqB1aQyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPScjPmNxSr2YT2IvEKemKWAPgTymLvW3gbEPh9aW2ZDQXmS+k82sz2zrDcuaytnb
	 rBC/doh50rFtdR/0+XtqFzla7SsRmcePwtR4NVQiVI2wRrwkuwWUk0kIDbZt05YO5F
	 otWCj7/ZGl/i6yRPLueJR+I51Oeuxgq56ZCmvVnERBu1Jeagwv1QgR34hXDqEOxNdu
	 O6iNJDRiTJWoEmz1aHW0prY2qr0OlRq0QNb1oovA/uTymM1/lcCzexFgLxMUnazULL
	 cu779WiBhiZevR4pqBAFkWuaRwMKt4gDM2Qvxf18HUJcdLDB2FZzz4Jp24gFzRAGSJ
	 PJxgmE5aJyK0w==
Date: Sun, 20 Jun 2021 08:56:51 -0400
From: Sasha Levin <sashal@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
	Ondrej Jirman <megous@megous.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Maxime Ripard <maxime@cerno.tech>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH AUTOSEL 5.4 07/15] drm/sun4i: dw-hdmi: Make HDMI PHY into
 a platform device
Message-ID: <YM87E3tYj+awywpN@sashalap>
References: <20210615154948.62711-1-sashal@kernel.org>
 <20210615154948.62711-7-sashal@kernel.org>
 <CAGETcx95bOAHiOm0MHqFWSbc8ONBPEzXbDyP82pO4B5o2QOX1A@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGETcx95bOAHiOm0MHqFWSbc8ONBPEzXbDyP82pO4B5o2QOX1A@mail.gmail.com>

On Tue, Jun 15, 2021 at 09:26:16AM -0700, Saravana Kannan wrote:
>On Tue, Jun 15, 2021 at 8:50 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Saravana Kannan <saravanak@google.com>
>>
>> [ Upstream commit 9bf3797796f570b34438235a6a537df85832bdad ]
>>
>> On sunxi boards that use HDMI output, HDMI device probe keeps being
>> avoided indefinitely with these repeated messages in dmesg:
>>
>>   platform 1ee0000.hdmi: probe deferral - supplier 1ef0000.hdmi-phy
>>     not ready
>>
>> There's a fwnode_link being created with fw_devlink=on between hdmi
>> and hdmi-phy nodes, because both nodes have 'compatible' property set.
>>
>> Fw_devlink code assumes that nodes that have compatible property
>> set will also have a device associated with them by some driver
>> eventually. This is not the case with the current sun8i-hdmi
>> driver.
>>
>
>fw_devlink isn't present in 5.4 or earlier. So technically this patch
>isn't needed.

I'll drop it from <=5.4, thanks!

-- 
Thanks,
Sasha
