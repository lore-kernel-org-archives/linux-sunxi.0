Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA928F1
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Apr 2023 16:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C7DC433D2;
	Wed,  5 Apr 2023 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680712752;
	bh=ZU4IDuI+UD+VYcqVNYCPsCR1gEEXwDspotTAU5Z68mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcwei0ZIHgrfb/bgNI3r8QtveRqgaFJPGCR4450FAHyW0oijbi4holZ76FOdmjCQO
	 OjTzfveG9WC2EzBNZdL0DobrlUqs0Jn5wcJXMEPSElL9pXT/kd00NjrciQUAUnGfiA
	 E33/nzdxauL4B6coAh87deRZTOf49q0Qj5/1N5bgz/FN/d1NwnT7ugiccACbXM0fkN
	 g6DwZyCUoL04fDx4epb3GwXzfHr7lA2KI0xEAkhaR1EMXlepjUDpQTLJvFk9QUc+4e
	 XlpDyOe+m3axxa8vMIqdnN9shZlT6yO27ciVaIrUtCdZ7xfk/f9gV8D5ndt6jL7DeW
	 LF4ANjVXpBPBA==
Date: Wed, 5 Apr 2023 17:39:06 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com,
	Shengyu Qu <wiagn233@outlook.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/3] regulator: axp20x: Add support for AXP313a
 variant
Message-ID: <20230405163906.GT8371@google.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
 <20230401001850.4988-4-andre.przywara@arm.com>
 <20230405142103.GL8371@google.com>
 <f1d7526b-7f51-462d-8192-0a05828bfc4f@sirena.org.uk>
 <20230405153651.GS8371@google.com>
 <e86dd4a9-540a-461f-a78a-5acb480e98b9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e86dd4a9-540a-461f-a78a-5acb480e98b9@sirena.org.uk>

On Wed, 05 Apr 2023, Mark Brown wrote:

> On Wed, Apr 05, 2023 at 04:36:51PM +0100, Lee Jones wrote:
> > On Wed, 05 Apr 2023, Mark Brown wrote:
>
> > > I'm waiting for the MFD.
>
> > To do what?  #deadlock
>
> Whatever it is you need to do to be happy with and apply the shared bit
> of the series.  We're somehow on v10 here for what seems like it should
> be a very simple change, I've not followed the ins and outs of how that
> happened.

From an MFD perspective, reviews happened followed by an approval in v9.

I can't do anything without an Ack from you or some indication that you
want me to apply the first 2 patches and share an IB.

--
Lee Jones [李琼斯]
