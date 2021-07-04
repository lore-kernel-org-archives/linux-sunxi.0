Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D20870
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jul 2021 19:57:01 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 573195C004D;
	Sun,  4 Jul 2021 15:57:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 04 Jul 2021 15:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=e
	Zhu4x6y/cdx0y5ETU2KCxLd7rApHiU8htJbWuvvHKU=; b=AOPW0xvsd95nXlTp1
	nDddpz7bd0tH9WHNZQJTrlpBPPb+zWGdeOWUBRcNKTIcKsvpkk3K2BbowvgKxWBS
	7X6uN9cRD/WMfxAOr7nyCCBZRd82uiG2Gll0n6ZChUyRQVAZm+B0DUO62zCIAMZJ
	6aL+/MyYGFB4U/NmyvOLNsIQAYiXIqq7PDFZkaMStAuF6yfIfwhsOtTVYAfX9Psx
	rCH++V8J5R1XQxciesVghk3FhSg35FjNBAZ2FvGEaH3nHqtfm9QkNL8cQnOqpFEk
	fB5kmvWIzHHWbHAm4WxC7Lf8xh2YcaFnYN3C2MFhLPktr4Qbz36WnnDMM4ixDNzE
	0GcNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=eZhu4x6y/cdx0y5ETU2KCxLd7rApHiU8htJbWuvvH
	KU=; b=Cdxb06F3Dwkix1VDuLiQpszGMx0sFjAYy2FhuSRMA+m56T/Qvn53pzrjf
	Zzv90Pxij1halEueQJH1KsT6nsP8/cPl++2TQLNWtiF7f97al/lRdBBoSFfbonPC
	Uu2kEbUKMts1l90YvrcU09ByYMy6quvlS2d5wGW8671fRmMuXSXV0SC18Mm4LQWJ
	ezAprZcTKjJDoyVrDHL8Y0hckXsi+kg/Z1jSgMjzQGvRUNbmWzW3R2+qx2ulECyD
	ZE4uYSS5FHz0PfPkUE17DJe9swJ6RRoh+p3ud3ItwaduE1exguTar3Dr3+TXn19U
	VFscVG6pvcVfQKYSlgwG42XYWVPEQ==
X-ME-Sender: <xms:ixLiYF05vyfr17gNBaLDD8aaPjOrI3kpapDN7ONocL9YQ7jcLFOJFg>
    <xme:ixLiYMEWp4nDphOQHRNK_e1PnwlcIj0K4E4fLLoUs7OEjoWsrx2IVrbIRwuZVoT1S
    cgJBzrZOdXWI-PpTQ>
X-ME-Received: <xmr:ixLiYF5u4gm2zDVuoqp8O7ucqTwwp_OZsW40SE_LKaIwppLQzuVIxm-HNOXyPyw2Zaux>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejvddgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefgveffteelheffjeeukedvkedviedtheevgeefkeehueeiieeu
    teeugfettdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ixLiYC3eHCwPgBtfaZC0LF2htJNsaqP4h-1J4pIV7dtYzOy-ILNpdg>
    <xmx:ixLiYIHLpsugeW2dqwSzfa5eigsYQqIfIzmKG8id3XgpA_AZvaQqZg>
    <xmx:ixLiYD8orYoJrQ3LhYhPQ6omk27oIWRXGj2YdF8X52dSDlEpwih9aA>
    <xmx:jBLiYN6vkR8Qo3Y55zjUD98w9FH8VRDnhR7BqKQTs48JdDBAwyQKvg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jul 2021 15:56:58 -0400 (EDT)
Subject: Re: [PATCH 0/8] sunxi: mmc: Fixes and speed increase
To: Andre Przywara <andre.przywara@arm.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Cc: Peng Fan <peng.fan@nxp.com>, u-boot@lists.denx.de,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Ondrej Jirman
 <megous@megous.com>, linux-sunxi@lists.linux.dev,
 Jaehoon Chung <jh80.chung@samsung.com>
References: <20210524233029.16417-1-andre.przywara@arm.com>
 <20210704002444.22e1e507@slackpad.fritz.box>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <8a1c1d50-ee07-6df4-c38f-9dc41b984fc3@sholland.org>
Date: Sun, 4 Jul 2021 14:56:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210704002444.22e1e507@slackpad.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/3/21 6:24 PM, Andre Przywara wrote:
> On Tue, 25 May 2021 00:30:21 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
> Hi,
> 
> thanks to Jaehoon for reviewing some patches in here!
> 
> Can anyone else please have a look at this series?
> I am tempted to push them in the upcoming merge window, to expose them
> to a wider testing audience, but would really like to have some
> people's eyes on it.
> 
> Also testing this on different boards would be much appreciated,
> especially patch 7/8 deserves some scrutiny, I guess.

For the series:

Tested-by: Samuel Holland <samuel@sholland.org>

I have this patch series integrated into my local branch, so I have boot-tested
it on several boards: PinePhone (A64), Pine A64+ (A64), Orange Pi Win (A64),
Orange Pi PC2 (H5), and Orange Pi Zero 2 (H616).

Cheers,
Samuel
