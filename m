Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59BD7E
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Sep 2022 08:36:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id 6E4912B059B3;
	Wed,  7 Sep 2022 04:36:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 07 Sep 2022 04:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1662539787; x=
	1662546987; bh=po9Xm858L0cddUdWZdiBQdG3q0GGzu520DX8oi90AHk=; b=t
	nTK9Vm0HxO6Dz2vyUXzwimDbDYlwCmlQyjZ7GgmLgpSPym19UNCgba9j/hZgbPDz
	plhRvnZE4tkFDfA6QEu6H1SZUmHSmkaJf7AMF6I6ULSerLZJKaNGn1JXx+5ve9xA
	lfOSLypV51NKc+drg+SY7e97CeM7MVg45FovCocuWRudrN+ynqGtiYIixTIT4sUW
	LO2RJy8hNgXQCKO88w93cvEqVMlTHgy/jmPVvbr91vOfhCzesjnMPGP8HkZZUvy6
	BldlOyGN/fmSRsPmNbG7bPzZPaIjP5yj5G7vQ6a587hK4mvNc6meprt8abnJP83g
	ZwmgfCcRFk7OhyTLTw76Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662539787; x=
	1662546987; bh=po9Xm858L0cddUdWZdiBQdG3q0GGzu520DX8oi90AHk=; b=A
	p4Fx1/TRiqWHa2y+oaJMxELoiun10IIXj8MIAzE6xrPWAvQGG9d1qXZlRbJckUVI
	Afn2O/7fWg1JIShzwNabM1Zqtgqwkas36Abyp2CI9omix1KWyotBFbLeklVmTpvc
	3NJFOSZcdGRpwwVOPEqwssZELovxLmPJSavIm6iZzqyem8pT8yAyPLn7sLEjXhZv
	E8n9cb3wsXE+OGIfVDJV2ZT8OY3jnqFXP+zXxB027LDU3vO3oUzefyq3Quwji6DD
	doWWRBw+Add2E8xo0L1F7kImsTlOFCSR1AXxta8JD7VY7hHUHO3JBrxRUmiidXGU
	rfVL3Hu5Tdx+gUaxx321A==
X-ME-Sender: <xms:C1gYYylGD6PWkNVmDgOax7oZftfh_BO6Gf7nxG5yoqLDm2MD0IjtLA>
    <xme:C1gYY53RS6pV--bsb_FfxREhb_VFJ7q04WWXl2UfcddOlFmKt462GNtq31Nk0ebdi
    OVu7JQZ4ZnYitCXX8Q>
X-ME-Received: <xmr:C1gYYwqmt_rIHWH1uPAalaANaiwhDkntB5WnmdwLlVO5IaXC2N4JGtMwVOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
    vedufeeinecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:C1gYY2kaesFMDJteUnwOJadqi1nctjmr8fclh3Ryv7ySqWHqbuSAWQ>
    <xmx:C1gYYw1Zx7eHWPn0Y4zhHvMgszuf8E1s_xe6MwkEuUZ6W3d-f-vPlQ>
    <xmx:C1gYY9s0xTinewcUWfzthCh9e2S1kauqPhnlbLw5f3xuY6ZGzaMHyg>
    <xmx:C1gYY1_eV0VIiPvx_YzD44rNwJKuP3WfNv7tT5koXSbBBFao9odE-Tpb84U>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 04:36:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>,
	Samuel Holland <samuel@sholland.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Emma Anholt <emma@anholt.net>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Lyude Paul <lyude@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>
Cc: Dom Cobley <dom@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Hans de Goede <hdegoede@redhat.com>,
	intel-gfx@lists.freedesktop.org,
	Phil Elwell <phil@raspberrypi.com>,
	linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	nouveau@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 40/41] drm/sun4i: tv: Add missing reset assertion
Date: Wed,  7 Sep 2022 10:35:09 +0200
Message-Id: <166253967462.2236193.8270005092779709066.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-40-459522d653a7@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech> <20220728-rpi-analog-tv-properties-v2-40-459522d653a7@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 29 Aug 2022 15:11:54 +0200, Maxime Ripard wrote:
> The reset line is deasserted at bind, and asserted if we ever encounter an
> error there. However, it's never asserted in unbind which will lead to a
> resource unbalance.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
