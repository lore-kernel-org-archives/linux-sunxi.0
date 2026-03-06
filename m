Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34D1A23B9
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Mar 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803826; cv=none; b=t1O6ybjkgpE4+7y0dRjRYmzqGqQ3LwJaNBs5/WqlrELCsGQqzUQvSuduh8BHoNCQJ13ZISb8Li3s6s7apFXR+Jyu96hOr7rWnXm//L0g/+lbDNP9AMrlq13n1+dRasGzJnxSh/UaeQg4JfsDjacb6D9Oa+HfMMLLLodBVRA3FBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803826; c=relaxed/simple;
	bh=oHZ2zmFj9TJrGr94fQXhAE04XiQGeJak47Kef9TTsEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TroUW3p8P1fRld2i7b3btSju8VEZFlx7JP7J7QxuwxEfXm2DfseaKOece3rZKwQf/4aJbpQjVNMGIbNs1aUOID6mD6cw1fvp+nb3/ZGdQETOfd3ikRO9PQ1lOlBr0Uac9BJ4HUdEo2m6Q3Vh0yCFBrqDKijF+dxFgUtZxA/sGu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UltR2bA6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UltR2bA6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 17AD24E4258F;
	Fri,  6 Mar 2026 13:30:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D978B5FF92;
	Fri,  6 Mar 2026 13:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83118103699F2;
	Fri,  6 Mar 2026 14:30:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772803820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gLX/vLGdWOlScvV94mBZQHZ++2FDe6d8l62ZQIqal5o=;
	b=UltR2bA6NlebUf4a8560wOZ2sCNSLRI2hwC35B7QGMOuDXtMFMOj92MOCEQL5ArIj+eU2T
	Um9Ke1hmuZ7eCVJNYIuqidEEMkJUjWWmPPc1h2KGbogfMsSAtdeJ2M8fcWmFDCPEmDmt9/
	WHXVn6EgXvVVn/JhWfbkwdFiKEX002Mnas0hC7Xhq5W7XkxMPDqpj3ACPFnnjX8jt0RA2H
	WtAdm8oRtMMuN3VzoUYRWtqp3SQycrp85kc2l8Mn6tXjTUXUFy7Z6M5f5cOmLHrX90BjMJ
	9QbQae0Yurqf2N+8lAy+/oE8+WTTkEYJJKzPfCQWwhZMpCYHwbXjw9i/o8k4YA==
Message-ID: <690fc924-8605-45f7-810a-4c8e58cf4db0@bootlin.com>
Date: Fri, 6 Mar 2026 14:30:10 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 4/8] net: stmmac: mdio: convert field prep to
 use field_prep()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy6AE-0000000Btwv-1LM4@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vy6AE-0000000Btwv-1LM4@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 05/03/2026 11:42, Russell King (Oracle) wrote:
> Convert the MDIO field preparation to use field_prep(), which removes
> the need to store separate mask and shifts. Also convert the clk_csr
> value using __ffs() to do the shift as we need to detect overflows
> for this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

