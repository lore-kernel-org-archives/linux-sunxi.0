Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC28F7C
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Jun 2022 02:08:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 7809B5C017F;
	Tue,  7 Jun 2022 22:08:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 07 Jun 2022 22:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1654654081; x=
	1654740481; bh=05QZClo2yRu6zGn/RtcdmsWqfd2yLg+tYmuQf+IHflM=; b=W
	7ylr1Cz8I2bcGjq6J2AfXA97LCKEnlzlC4yu7bBgq9ztFkDN0DjOXKylDmRZIc+K
	jAptCCh1FtB//Qyh0MGZfT2x5GBADaEEUCnbuk5bvkSf/Oaoub52rGtz/f9G2j27
	MMgc+bickXPsSPBk5Sn3MMofw6bxWI4FsXecMD5GmW46U9SSiPfJdQ2o05CTJWKn
	PHZTVHxuIneZyCshv3Jpplcs+TEzHuRSS60dy0+k3ZhJ+2gkFNPOpBeHDY98GmzP
	pg+dlHV7eOr8dbrKQ0T6/i7ZcYIVz/F09diw4g4zxvLYpM243VYZ2ateXBiEjO7D
	f+8NwylBiTp1EQEhvd+Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654654081; x=
	1654740481; bh=05QZClo2yRu6zGn/RtcdmsWqfd2yLg+tYmuQf+IHflM=; b=l
	+/UtXrfs0rk2folZfGGA9BH3QMGy+7xNSq7gfBq5IiepgGtfpMxoqtm3jLBJmrZv
	eNslQR4JGsDAYLU+PZ2L23PDucfMsieUNwG9q1exU1c+qPa+RN5n3nZEVWOyp8Jb
	8lTDy+hJXGl1/7YEDdxkKtvYZa9VCGnWVZ784Sev41kOdiF9OcvCvbAbs5BFFpq6
	Dfi4H9WZbeLvTXNbJaJLQY+ejShLpdAoaCg6qfsOH5bekuBlX5v+ykHvVMt0/D+q
	sRxjQGaaCL1wWcvNTB/FzK3O3M1EowB+tuywiU2UZoPT46qvQeOvywRIsqcRvKVT
	L2uClmj0UPkZRQnYGxm3A==
X-ME-Sender: <xms:gQSgYmRLo04Kw29jFteSXEFDUJwyD2hCzDz8i3KG4UaadsS6rpyUUg>
    <xme:gQSgYrwNabGPxNuZ_CvIqJyclytV5oD6RbIvD9rlCJWJTH6p1Tax1Iew8NHsZEttL
    nFJGSw60zJQXvR3iw>
X-ME-Received: <xmr:gQSgYj0ZwpTTk1cPtY02xbji9XPxqhg5DhiD-WSKFMfK1pEVw-an_Abr5-MZoTLIFSZ7gUtqm8zIRtX9ef0zaDvlquJxSWfFfqHzJXD3mQg-E_xIlcOxWLujgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtiedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedtvefhheehgfdvkeetffeludeuudehudeuvddtveelleekvedv
    uedviefhkeeuheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:gQSgYiD5cChSNx43UYJFhTB58nqMypPos9f_tQ1I3v3giReVv6fgAw>
    <xmx:gQSgYviWsF0kVdWTo9uw3DSSXuYn0DNL_xdSKUZgkNodem-trtjXDg>
    <xmx:gQSgYuqzWUk86YhfgzTPda0DMqKgQO3pnCCrYukuAPu8joHqothJkQ>
    <xmx:gQSgYlYgoQAZCbYUSRDHV1IC3HZu4_UFHReysvRI6Wi7L6-6O3B84g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jun 2022 22:08:00 -0400 (EDT)
Subject: Re: [PATCH] sunxi: usb: convert PHY GPIO functions to DM
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 =?UTF-8?Q?Milan_P_=2e_Stani=c4=87?= <mps@arvanta.net>,
 linux-sunxi@lists.linux.dev
References: <20220608000604.3357-1-andre.przywara@arm.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <5737809a-f9e2-f325-5168-d222968a02d8@sholland.org>
Date: Tue, 7 Jun 2022 21:07:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220608000604.3357-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/7/22 7:06 PM, Andre Przywara wrote:
> The Allwinner USB PHY driver is still using the legacy GPIO interface,
> which is now implemented by the DM_GPIO compat functions.
> Those seem to have some design flaws, as setting the direction, then
> later setting the value will not work, if the DM_GPIO driver is
> implementing set_flags.
> 
> Fix this by using the dm_ version of the direct GPIO interface, which
> uses struct gpio_desc structs to handle requested GPIOs, and actually
> keeps the flags we set earlier.
> 
> This fixes USB operation on boards which need to toggle the VBUS supply
> via a GPIO, like the Teres-I laptop or the BananaPi M2 Berry board.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reported-by: Milan P. Stanić <mps@arvanta.net>

Reviewed-by: Samuel Holland <samuel@sholland.org>

It looks like the other users of sunxi_name_to_gpio are unaffected because they
call only gpio_direction_output (sometimes repeatedly), never gpio_set_value.

Regards,
Samuel
