Received: from out-62.mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395BFA922
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 08:30:40 +0000 (UTC)
Date: Mon, 17 Jul 2023 18:26:12 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689582638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NDupejGpqDico8n1rGJuzDxwPUMrIMMY/ohhGN16//E=;
	b=l2+vsVzqezgTgYlaCX2ktVVIRqDY9iUGEYuUPBAi6cJbRrcqHvdVNNWSj0wizxaX1s1uy4
	hPTk2Jhj++16bPVByIzH7wymnQR63xcA2In1wm+lJwlOvgpdp/p8foiWD9ul8s+Lc1H8UD
	f9IrXIFOQk753PnJLdsMntD8WOEyWrp046XzwKvp6eEEni4lkwHabX1MW8EloqqDFIOTsl
	8EpMTrPn0WZ0SGmjPaeXWZOfETbn/MmJYv4G28qE7+DYv7HB6m1LGnLEvLUvhtRn6DQYDq
	cv/UjLHp8XgHhbtNXJJNK2V0bqXm1uc3FhgL6BUnjIGpkQnOXcHvfrnJo6ZiXQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <ZLT7JP9gxsiNGpO_@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-3-contact@jookia.org>
 <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org>
 <ZLQf5AYOCT3EQXyC@titan>
 <9cd339c0-5e96-beba-e567-0a18d11d06b4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cd339c0-5e96-beba-e567-0a18d11d06b4@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon, Jul 17, 2023 at 08:39:52AM +0200, Krzysztof Kozlowski wrote:
> So the others you skipped  Like let's pick this maintainer, but skip the
> others? This is not how does it work. You are expected to CC all
> maintainers (and to clarify the obvious: maintainers, not random
> contributors). Some maintainers explicitly agree to be skipped, but
> where do you see such statement from me?

Apologies, I didn't know you were supposed to CC all maintainers in the list.

> 
> Best regards,
> Krzysztof
> 

John.
