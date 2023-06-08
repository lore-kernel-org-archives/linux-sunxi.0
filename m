Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2156D539B
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Jun 2023 09:33:31 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4QcJtB2TJ5z9sZL;
	Thu,  8 Jun 2023 11:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1686216802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3o9iqTcADNP2uWhkzkA0IAS3M4zfQXXf39LOvZbbnI=;
	b=1fEf6UiDIdhopDV6j7Dk1tMGFq0ig6NZ2MA940WCp61viWTy27wmj4mfZnGtR+JGk+IZqY
	mWrMyLLWLSZKsXdngHvAviG48sXcw/AhNQUrYIJN+a9ZJKZiPjNQSBQMFjZKK4U65/VePH
	h6RzbAafwJgYsQq4Vcj6+YpnAs6Djd+qnk0X1/oAGiWFmzKRuDJWIO/YSwfRNEWaeCrjte
	H0tNJNpvZDVTWAt0veQnC4O/S/LeeHxx/m5Z5WUr5TsJJS+4KFbv2YJeHWTyNO8Q9f3wY4
	kh5Kr9u/7KjFDsz3zFuBC/rBaY1xHC0pCTHSPiTfTuspWSzS1pM7wQ3Hm1Fhww==
References: <20230605190745.366882-1-frank@oltmanns.dev>
 <87legv2093.fsf@oltmanns.dev>
 <vvmdk3fqtjt3jspxgvlbypdxajchymydshya5b5ivk3wfodwwr@yyi26m6toosh>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Roman Beranek <me@crly.cz>, Samuel Holland
 <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/2] clk: sunxi-ng: Consider alternative parent rates
 when determining NKM clock rate
Date: Thu, 08 Jun 2023 11:29:05 +0200
In-reply-to: <vvmdk3fqtjt3jspxgvlbypdxajchymydshya5b5ivk3wfodwwr@yyi26m6toosh>
Message-ID: <871qim1eow.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


On 2023-06-07 at 14:27:46 +0200, Maxime Ripard <maxime@cerno.tech> wrote:
> [[PGP Signed Part:Undecided]]
> On Wed, Jun 07, 2023 at 09:35:20AM +0200, Frank Oltmanns wrote:
>> So, my question: Is spending the 30 ms fine or do I need to optimize for
>> speed in order for this patchset to be accepted? Or is 2 ms also too
>> much of an increase, in which case I'm out of ideas. :-)
>
> You keep mentioning it, but it's really not clear to me why you think
> that both are intertwined, or depend on one another?

I'm sorry about that. I guess, I got carried away. And furthermore I
took your mentioning of all bets being of how often setting rates
happens when HDMI comes into play as encouragement to optimize for
speed, which it clearly wasn't.

I saw the increase in time as a regression, because it might break
boards that I don't have access to. But since you say it's fine, I'll
speak no more of it.

> What's wrong with just merging (some later version of) this series?

Nothing. :-)

Thanks,
  Frank

>
> Maxime
>
> [[End of PGP Signed Part]]
