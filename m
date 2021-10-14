Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9042C80
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Oct 2021 07:19:14 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id C077E3200F76;
	Thu, 14 Oct 2021 03:19:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 14 Oct 2021 03:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=fm1; bh=
	F2Rlo3pG7/T2FxEsr0KOZ4crG200uyMmemWSXA7DDOo=; b=GA8tV7q7SGfmJK5v
	LDKn+8unvR8XwjmUoeF/SrPAnNfYSW8mT/AEi5Nr1pxPztJ6pDrp8hun0DKtwqbT
	YikOlqjiRX3hPRE+G/pInUI9QEYlqgyJaMmDvolQSlSaOQrTRFfCnP4qG4CZ7vvn
	Bc1eIg1WgjHXkkj90VdZ9j0anOgFXgPeJi85TSnHuxVEArmZ0S9AH7RaoPS8q2N4
	33VdIZsoUDEGwervYy9sBu9axNWTRuQHr5c+ehkLFzhrwmH36Lct1Dbh1WarO1Hp
	dxn4IrKfAZT66jHNbv4XNd2RLLzv7AdRZ03QRT+5+4L5Xp5yklqr6hgIZ2kvU2ZN
	z/i6vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=F2Rlo3pG7/T2FxEsr0KOZ4crG200uyMmemWSXA7DD
	Oo=; b=c/9CA+5TDikB4A5E6mnApLU29SsCfmZhDkNHhcYPTQpQWTu3QgRgUQx5T
	93qcdYqYK5VQZRmH+eciN9zl3El1acyQWO/D+JOknCv7GLMjh+HAfqlf6NJOW8ow
	OCuyx3vJhwUYryDEG/TxweBVPhqrgNwI0Qf0gKcXU4+eEyqRdgL3RBcRag6+FHXP
	wX3mD5r1OJHWI9hq5cYWW46l5tObWiVP64vTbdPrCXLjgiZpsGz6yrWRXqJJRVUk
	CDJfOCESCheUYjRzedEQcXfBsSrK+BFqkPaO9rdM2doZUdPv7gt2oA4v04l/mMsi
	GSQl86Yu/d0XcWagbkXIlvQw7ggaw==
X-ME-Sender: <xms:79lnYUULpDR2qqLf5eCpwWIgydUtUwnz5LxDSCgjgrj9mUN0vC5V5A>
    <xme:79lnYYnmik0_8XpAEsULCi2r1Rl1srW1Rh4sVtQ55cANCRGNlsU5gnrAgGYcTSioy
    iCIeuDiKWmQPMdQUMQ>
X-ME-Received: <xmr:79lnYYaW7xohNCGgoUJil_rtnalZmgDu6Z79-imYlOHQXbocis7SHaxtMzvWLCfgn2qMcEdnwjEv8mK-igq9p0f5geDVZ9fVPeNJeB3q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduuddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
    geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:79lnYTXnqvW97G0CDq25cIzZP-Xv_pJQNLajPyqiFoybqXBJ6KkBkw>
    <xmx:79lnYenTnXwXQ9efh2GUiAel2KTYxwxtdxPex6sWpKHG9AhY6WZNyw>
    <xmx:79lnYYcsScVfGs9xdr6TEj0ADLdaBLXSzRB_9iSscENAInrYb3iUDA>
    <xmx:8dlnYY4saWINoiMW8fOvz5EBMwi-JW35roxIdNGrqwg2H1LZUPg9Fw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Oct 2021 03:19:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: Maxime Ripard <maxime@cerno.tech>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH v2 1/1] arm64: dts: allwinner: NanoPi R1S H5: Add generic compatible string for I2C EEPROM
Date: Thu, 14 Oct 2021 09:19:08 +0200
Message-Id: <163419591550.12887.3922965522049640915.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211010135017.6855-2-amadeus@jmu.edu.cn>
References: <20211010135017.6855-1-amadeus@jmu.edu.cn> <20211010135017.6855-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 10 Oct 2021 21:50:17 +0800, Chukun Pan wrote:
> The 'microchip,24c02' compatible does not match the at24 driver, so
> add this generic fallback to the device node compatible string to
> make the device to match the driver using the OF device ID table.
> 
> Also set this eeprom to read-only mode because it stores the mac
> address of the onboard usb network card.
> 
> [...]

Applied to local tree (sunxi/dt-for-5.16).

Thanks!
Maxime
