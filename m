Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEAD63AE
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Apr 2023 15:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65DBC433D2;
	Wed,  5 Apr 2023 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680709017;
	bh=xi8fxeIahJClG3Ca4lSBi8mYKmlZQafWhu28ijvmkGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkNKL7GME9JiTaDSJiimGhBr+WF7sRfJBdf03It/QeNHT60/afZZ/MxUAWbhIJ/R9
	 bUT0nuWgtKYhmq7qJpGiXprsMcSUjSs8AC4ZlO4rLvuOL0e8fYus5pkFEvvFQaltnC
	 7R7ewI1PKZXgpGl2M3x4T6mnRxC2CoyKDuXqD3Xl33nfd+VVzVDIz0Nx5usfCVxKlB
	 bSkoYA9xx697UXBgJHqHimeqOE9oxCQjMFLpys1Rshgu+OpjHDOouAh5r5owiMxlX5
	 5hjECcUKcRCVWrfqkeOlJglhTKxM7aBp6sawCV9KykINL95hdPsJH2KE6nVTjRckyO
	 vLGdP3L1dKQPw==
Date: Wed, 5 Apr 2023 16:36:51 +0100
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
Message-ID: <20230405153651.GS8371@google.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
 <20230401001850.4988-4-andre.przywara@arm.com>
 <20230405142103.GL8371@google.com>
 <f1d7526b-7f51-462d-8192-0a05828bfc4f@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1d7526b-7f51-462d-8192-0a05828bfc4f@sirena.org.uk>

On Wed, 05 Apr 2023, Mark Brown wrote:

> On Wed, Apr 05, 2023 at 03:21:03PM +0100, Lee Jones wrote:
>
> > Is this on your radar?
>
> > Can I take the other two patches without causing issues?
>
> I'm waiting for the MFD.

To do what?  #deadlock

--
Lee Jones [李琼斯]

