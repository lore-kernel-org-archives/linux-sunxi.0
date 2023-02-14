Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8986C0A3
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Feb 2023 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=9IN3eOt3oiputxBZkCNAXozCKfVDwLRKM9iYz/qgSDk=; b=csG4bZANruBFHWc9GszVvK0FLy
	bhe1HV3ZBNcKPt034MHOYz9gxDuKT7ui8J3EydSMgBZYqaoDsYgZMoXStypl6ApJnNb6uplWeV9Ez
	eMSiAiOuRXbRH3XeO8t/7J0IjrvxiOSAO1m3jEhpBzHKkzm+g9RnWEJn7Oo5BuCA8MJPdLwwSnZ4P
	vklv9P22GCqKYMTpezBSrhguVeNgzPmEK2IWAJPI0h76/NrDNBlUyIOUx1xmYTLFRSCWe88oxDKY5
	C9N4HjzxCoKFGVhHx6F6cB0Nyh47prCHJsoGOUKFqeOaA0q7in51Q7i9oKY76f+N14uEsKdIbdrHZ
	xLH+MhHA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pS3H7-001tak-WF; Tue, 14 Feb 2023 21:55:46 +0000
Message-ID: <d483ea28-feed-41d1-f9b6-4abfcfe42874@debian.org>
Date: Tue, 14 Feb 2023 22:55:45 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] Enable hwlock on Allwinner A64
Content-Language: de-DE-frami
To: Andre Przywara <andre.przywara@arm.com>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
References: <20230213231931.6546-1-bage@debian.org>
 <20230214001805.6ead683d@slackpad.lan>
From: Bastian Germann <bage@debian.org>
In-Reply-To: <20230214001805.6ead683d@slackpad.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Debian-User: bage

Am 14.02.23 um 01:18 schrieb Andre Przywara:
> So are there Linux/Crust patches out there that use this device?

I do not know of any. I was just investigating the chip and checked the parts that I could easily use in Linux.
