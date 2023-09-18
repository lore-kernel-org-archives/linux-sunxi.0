Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16E3262AB
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Sep 2023 17:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D89C433C7;
	Mon, 18 Sep 2023 17:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695058085;
	bh=eyW6d2pjl5JU+Oz+ApgrqSfhAmLNl4BcssGT7YSphc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbB1z5mkBAWHsfRvsZjvsxYzLRw0rJ3dlSLzqGZnFL0OiHGKU3XT0Ar4D1kXG4XD7
	 xFhrMDdEpKDXiHg6+K0ZGUdAZluvjGTxJrf3FHpDD+OP0fVavsq2DCxh7xTcgDg7Gg
	 u1DgU/jXP8TnhGe7nQ4bpE9xGBEeqxo2+lypfx/Dhk3H3XXNSwQ3ZrQHscqeavAkXl
	 nPz4N6yoaiRK/1ob/iNTjYnWCI7Th9DJdC/D+JtX3EbwSSrstUNkWdFe3gVdWSwv+z
	 nSoOBPoE+Cc3NjcINchZDJ9IUvvPlk9+ByFtJVC0QGLh1UyAlAZiRmAVMrvMqezNZJ
	 XnVkn/8Z+6KEA==
Date: Mon, 18 Sep 2023 13:28:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, anarsoul@gmail.com,
	tiny.windzz@gmail.com, rafael@kernel.org, wens@csie.org,
	samuel@sholland.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH AUTOSEL 6.5 6/6] thermal/drivers/sun8i: Free calibration
 nvmem after reading it
Message-ID: <ZQiHrd0BH9f8OAQa@sashalap>
References: <20230909011254.3581788-1-sashal@kernel.org>
 <20230909011254.3581788-6-sashal@kernel.org>
 <ZPxm/xjvsI24JWkB@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZPxm/xjvsI24JWkB@finisterre.sirena.org.uk>

On Sat, Sep 09, 2023 at 01:37:19PM +0100, Mark Brown wrote:
>On Fri, Sep 08, 2023 at 09:12:54PM -0400, Sasha Levin wrote:
>> From: Mark Brown <broonie@kernel.org>
>>
>> [ Upstream commit c51592a95f360aabf2b8a5691c550e1749dc41eb ]
>>
>> The sun8i thermal driver reads calibration data via the nvmem API at
>> startup, updating the device configuration and not referencing the data
>> again.  Rather than explicitly freeing the nvmem data the driver relies
>> on devm_ to release it, even though the data is never referenced again.
>> The allocation is still tracked so it's not leaked but this is notable
>> when looking at the code and is a little wasteful so let's instead
>> explicitly free the nvmem after we're done with it.
>
>This is a minor cleanup which as with so much of what's come in today's
>backports seems very questionable for stable.

I'll drop this, thanks!

-- 
Thanks,
Sasha
