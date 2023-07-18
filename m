Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB8515AEA
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 22:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165B0C433C7;
	Tue, 18 Jul 2023 22:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689718505;
	bh=2Eab4SU5ZrkW5P4w373zamoOL6oOuQGhERItFpuL4Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGdExfIIdbIaKLN73wYPRyKRQClz5N8LUPwGKnCMuMIUy/OAaP18ydXCF9/dkWpzd
	 Yoxr8g5QlT3kLegkUbqdOGNOjDY4SjZpFs8YsaBq4m5GIg51lUvXbNdskPo1u6AL1t
	 1OfqwhmJWMth4hek8k5MfHX0y2JYQcUX4Jk/dyB7xYzLPMhAd2vhDub6bEPEEEcZhg
	 Tg0gR2toTaqcydGkviD13oYaVPKlIp+CG9vNVt7WTcZNU30bWmptnus9jgmLkRzgql
	 vQYAsDE1CY4ydj0TTx5BQnlLXH7u53pql8p+WJrIkLg1n9A89YYc+ZNUwu6mhzycXQ
	 Q++KD3Yc6rI6Q==
Received: (nullmailer pid 2035108 invoked by uid 1000);
	Tue, 18 Jul 2023 22:15:04 -0000
Date: Tue, 18 Jul 2023 16:15:04 -0600
From: Rob Herring <robh@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Jookia <contact@jookia.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-can@vger.kernel.org, linux-riscv@lists.infradead.org, Fabien Poussin <fabien.poussin@gmail.com>, Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/4] Add support for Allwinner D1 CAN controllers
Message-ID: <20230718221504.GA2015343-robh@kernel.org>
References: <20230715112523.2533742-1-contact@jookia.org>
 <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>

On Mon, Jul 17, 2023 at 09:00:47AM +0100, Ben Dooks wrote:
> On 15/07/2023 12:25, Jookia wrote:
> > From: John Watts <contact@jookia.org>
> 
> It would be better if you sent your sending email to be the same
> as the from, I think you'd technically need a signed-off-by from
> "Jookia" as well.

The email needs to be an actual person. 'contact' doesn't appear to be 
one.

Rob
