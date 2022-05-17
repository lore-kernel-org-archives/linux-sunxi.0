Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510E7F
	for <linux-sunxi@lists.linux.dev>; Tue, 17 May 2022 07:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A26C385B8;
	Tue, 17 May 2022 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652772363;
	bh=e8dB8oDjlXZshFziU7mg5/YVotBJgiM7Y3R11mue6ng=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kJqctlKYqneUbfzJtm1UnZc5Akz5kdUaXVHoKu5QJA+itkCv3eBNmM8bB9PwIzeri
	 9PDB1RaZk4ejs5kc97tHLAL1u4B1TTFrlgJ+6lXTv4MQMjotbWQ45y77YXilLcUMLZ
	 KdZ5rbTeEKrJkFX7PUgsec6BpFvTz4/YB58SCp4LWppPfbF/271Xwt80tvnZKnpntH
	 NYR7GDNG7dZKjwNjJKMi5Q0ovizlAWr2+Dn28RYNP9JqnstOjmd0kVbcSOGouaitti
	 eAKfKcefKCpzSohnC7LhlrioWUlOCVSE7ciOdBDEOWVAlXi+E1ST2V3q8iJ/ZgeE2f
	 q+TvFiydtsm4w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220511200206.2458274-1-jernej.skrabec@gmail.com>
References: <20220511200206.2458274-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] Revert "clk: sunxi-ng: sun6i-rtc: Add support for H6"
From: Stephen Boyd <sboyd@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, stable@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@gmail.com>, a.zummo@towertech.it, alexandre.belloni@bootlin.com, mturquette@baylibre.com
Date: Tue, 17 May 2022 00:26:01 -0700
User-Agent: alot/0.10
Message-Id: <20220517072603.33A26C385B8@smtp.kernel.org>

Quoting Jernej Skrabec (2022-05-11 13:02:06)
> This reverts commit 1738890a3165ccd0da98ebd3e2d5f9b230d5afa8.
>=20
> Commit 1738890a3165 ("clk: sunxi-ng: sun6i-rtc: Add support for H6")
> breaks HDMI output on Tanix TX6 mini board. Exact reason isn't known,
> but because that commit doesn't actually improve anything, let's just
> revert it.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

Applied to clk-fixes
