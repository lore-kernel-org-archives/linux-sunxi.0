Received: from out-37.mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC3DEA0
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Jul 2023 16:53:39 +0000 (UTC)
Date: Mon, 17 Jul 2023 02:52:54 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689526417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdPWSeimVxVz91xQpsqP4Z46tm2ZX8etDGiqC5eAjnY=;
	b=yiYIdBSpp3Qlc5Nvg8wlFK23YkICxlgjlCAvrd8CIgCqv6CfsXiwb3hjS5aITUSvSCP+t3
	dYOjilmV/3oCefCfMuCmDtkgINtnZ2uzOKaeixeM5GHFDDf8X+j6OqmED1P6L2LTwp5rJo
	Mp8cdvHwhcxzZDZ13AZtKaNLisy/CTeM45sR1j1XlzTN+bdbXllMC1ksVda53ykY/aDZGN
	Www0zvg7+ihmzePP9aGKrqkJkQ/IHRDc6o5JfaihmKDQmNBuVF3SlQIrPF1HjiLGBzm0FE
	gZpGnlDhX7rJRISWrshJSZgx/0R40tdB6bm0UZA1I4kyeZmjHHplBwSaF61xBw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 4/4] can: sun4i_can: Correctly set acceptance registers
 on the D1
Message-ID: <ZLQgZvipHOFTlnnO@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-5-contact@jookia.org>
 <4844353.31r3eYUQgx@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4844353.31r3eYUQgx@jernej-laptop>
X-Migadu-Flow: FLOW_OUT

On Sun, Jul 16, 2023 at 06:45:25PM +0200, Jernej Škrabec wrote:
> This patch should precede patch 3, so in next patch you add full D1 support.
> 
> Best regards,
> Jernej

That makes sense, thank you. Will change in v2.

John.
