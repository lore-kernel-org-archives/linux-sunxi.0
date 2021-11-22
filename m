Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC89F2C81
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 10:49:18 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id E62353201C5D;
	Mon, 22 Nov 2021 05:49:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 22 Nov 2021 05:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=S
	GOZfLk5kGTbYYso5PbMkrIaaOpV17t/xhhyHD8MqZY=; b=S5/VfUWx6CBJK+h1T
	ZEQsR+RUQc/CuxhdQ1/COaOiC+h+Lh1pqGssm3uKrXRcN5Al6BDTO7nOYx3RCEn+
	TGTeQRJqni0X/4MvKD2RzIfeoZiyolBBHye+h3hl0FEEPKi+uGGET94pwD9bf3Wh
	PyWgItK42X+FrbHHmdYj/XrZbF0+aAu2pU1vxpCkniieq7HREwE2q50HZD4ZchuM
	v+mkvJDgl2IiLe/MOBr9M7ZHIZUu8vs/5YAdN+3FPpOaGyer0egiMcbVghSK91kb
	mFxG1gLsqo+cAFbQBaX8bPPmRHPJdvKzZduPqj27SWIiHcvo5bwVK6AF78s12+Co
	qHa8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=SGOZfLk5kGTbYYso5PbMkrIaaOpV17t/xhhyHD8Mq
	ZY=; b=lWwSgtV+ph8FAypsFeUg2X4956knWs4GayowCvJAcYe2p2z77RzWJKhO6
	tv4GKOCXsa9mmnA/BJCZu/aUx3Re5TZ9jEMsi6iuSy2y9+nmJ9Sjy10o5Ml03pqR
	kUSfCaksFvPNgOeYmW2kDt8VqFwJDl6fvcIz/M6njirtZotvSmJE3/oZu7PjJZeb
	d9LgQJyT/0L5Nesa2pofrQ7fX3uNXCfC9Lp8EqMIhxYI84mJIeKr9jhO2JR4L7/q
	FkPxvK2WCEd5oZ7hepBFrPyaDdUb1Y6dPL3+AKyJ/DTVQO/Y4Yqw07VsmRIfqnL4
	zbVlgdaNL4Ubvxtg5PGnP478q5X5Q==
X-ME-Sender: <xms:rXWbYerEB7EKaC1RdUM8uny4FEOvbj278mEngOH-zum3GFKTd5Trkw>
    <xme:rXWbYcov5xbFPvlRXknEW74YmB9aKoj49JZdRm7c7UAyYEwJyJa1dL4hyAIb4V8-v
    u_mGImVoG3WiwOaztQ>
X-ME-Received: <xmr:rXWbYTMt96bbLRIavzWkA72l9neIG9CjZfJW56L409BGIJtAz1W8kwzmpNfU8d2v1oq1pf5ZE5NPAMa5tOJqy0j0qdFsBiZekyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rXWbYd58wVPqtc2imblH-ahoV-0w-hTuqa7S9wBpu1EXKd8Ce2LEQA>
    <xmx:rXWbYd5ifVwId9cMdC_eAcuJEtGxH-eD3VY69Hn6JaXIDMzoZzrDxg>
    <xmx:rXWbYdgoxTExmXovA7gaMyD9aLKB5cj0rGxMViPorsSnHMYdV67elg>
    <xmx:rXWbYYZABPnogdX2vNu0PkmXNsu5UdEygX2cqj_St-BQb5rA1BdOwQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 05:49:16 -0500 (EST)
Date: Mon, 22 Nov 2021 11:49:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Evgeny Boger <boger@wirenboard.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Quentin Schulz <foss@0leil.net>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: document TS voltage in AXP
 PMICs
Message-ID: <20211122104915.zism6uadgwxjz5d2@gilmour>
References: <20211118141233.247907-1-boger@wirenboard.com>
 <20211118141233.247907-3-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211118141233.247907-3-boger@wirenboard.com>

On Thu, Nov 18, 2021 at 05:12:33PM +0300, Evgeny Boger wrote:
> Most AXPxxx-based reference designs place a 10k NTC thermistor on a
> TS pin. axp20x IIO driver now report the voltage of this pin via
> additional IIO channel. Add new "ts_v" channel to the channel description.
>=20
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>

Would it make sense to put the resistance in the DT as well or is it
made mandatory by Allwinner?

Maxime
