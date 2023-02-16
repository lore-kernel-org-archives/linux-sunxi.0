Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB87B
	for <linux-sunxi@lists.linux.dev>; Thu, 16 Feb 2023 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description;
	bh=rJMdqczWXRiQsSsJ4oTAxn1WK+A3eOMv7NUTintonZc=; b=rdfME8jOxuKi7e9fjhXk6y/oPJ
	/xTjwNpDvvThCVGr2McqvPVE0m2Yk6ZnaJ3GzkK1lwZYJ5U4ee4r8PMuZ8TklnUK7sIMqtx4XyBMz
	Go/vrQmN8Pv0JF+CekFV3eO6aOm7TYRkIOfyXnQgDLhXzxdYUWyHA8P7d1i+7IPwrxTz3Fkz8akn4
	HUO0oTFKD2/AV2ZKTOItuGvnrtMOJ7Cnsu5Rh0Fn1BXQ9TjQjtDb/9nAqXmRblkupkOVBMvV3kMkv
	9ixpcUUtDCBC3fQmkiENSllZcgylnl7o5wUS0TY7rmNlsjt5bBBA1M2hSAaPeMv7piQLYzp3U9wjk
	7gCLUVlA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pSZnR-003ADy-MP; Thu, 16 Feb 2023 08:39:18 +0000
Message-ID: <2720557c-15a2-a077-8608-133f58058e4b@debian.org>
Date: Thu, 16 Feb 2023 09:39:15 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
To: Rob Herring <robh+dt@kernel.org>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20230213231931.6546-1-bage@debian.org>
 <20230213231931.6546-2-bage@debian.org>
 <CAL_JsqJ6mvMZ2qWcSwKhuPRk29V2Yrx0_CCywmZd7=y-kzTRNw@mail.gmail.com>
Content-Language: de-DE-frami
From: Bastian Germann <bage@debian.org>
In-Reply-To: <CAL_JsqJ6mvMZ2qWcSwKhuPRk29V2Yrx0_CCywmZd7=y-kzTRNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Debian-User: bage

Am 15.02.23 um 15:07 schrieb Rob Herring:
> Now failing in linux-next as reported. Please send a fix.

That is in v2 2/5.
