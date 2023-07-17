Received: from out-27.mta1.migadu.com (out-27.mta1.migadu.com [95.215.58.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA7A920
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jul 2023 08:30:50 +0000 (UTC)
Date: Mon, 17 Jul 2023 18:27:09 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689582648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOmp5hitjZ7fhm1BXyLkFc2kTKDhZG8EGRqz2ebffbc=;
	b=GpXQf4zV2MwaDwhojYBOz5NC3XWNInzUGL9/0EirKSVhkIYqIJUXbUW8pkL6ukdaeW7FKE
	yZAjZCIPZufRStV9/QjGJBAvYi6ZijuhVWLYOU+IrU2AeHam8JGb2mK5exfQxf+an2AaPd
	I4Z/lvhjSF74e+9vL/MR4b7YiUMxgYQwYoft/Nm/PDk1F7K42H4DSRK1EkvlDpZgYJkppm
	JYAC5jQl53ExB+Gb0lg6AaJ7kRSMfhy3/38OrpD9RndOhYRby9eAE2NWAo1tXN4wU5obhU
	WhzbMoQe2Hi7Vf2OYHDLF596+3CaK8dHwUc8hPzKzl1D99agbwLgUkGRllzuGw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/4] Add support for Allwinner D1 CAN controllers
Message-ID: <ZLT7XYUziT11D8Nj@titan>
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
X-Migadu-Flow: FLOW_OUT

On Mon, Jul 17, 2023 at 09:00:47AM +0100, Ben Dooks wrote:
> On 15/07/2023 12:25, Jookia wrote:
> > From: John Watts <contact@jookia.org>
> 
> It would be better if you sent your sending email to be the same
> as the from, I think you'd technically need a signed-off-by from
> "Jookia" as well.

Yes, this was a msmtp mistake. Will be fixed in v2.

> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
> 

John.
