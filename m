Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988752592
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 09:14:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 934522B067B9;
	Tue, 15 Nov 2022 04:14:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 15 Nov 2022 04:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1668503650; x=
	1668510850; bh=L2lkXvh9lHqusgw47iG7m2rTmi/a22pY/qGXvnqsso8=; b=V
	NxJQnW5l8pBiQZdyDzqvX0Aept8yEYzK5izoyOEPsVefJ757gC3AcSf3yQZcbklL
	LZeXwOkoX95DhhAMa7btrHsqVv3qjsyCwxgv5zqMWnVjL6j3qLqH8MpYtWOBT9Vl
	MwX6sDhZ4baQ0e1SeSPshEW+XjIuN7kCsrbP9dsIt/azr6UhXWbmF4kfJwUyGYev
	9ZTo8dS6SjnG0hdX9ZTDvc8QnuT+lD9NK8UT4Br1fRMhXhKu3ac7UcwObSPOfBUL
	PbQcDQZG0RCklnmq6ekO6v/XxqcZx/kC4KTp6RGgOsmxoCoLojN2USOZtsnhZxv3
	RXv1BN4zObD+eV5L9QRwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668503650; x=
	1668510850; bh=L2lkXvh9lHqusgw47iG7m2rTmi/a22pY/qGXvnqsso8=; b=N
	4A7/XOAFfP5Z1YBiU5i4FPwcGt4jOzGsHxtbbKNLyx5Fgi78TBMbzV73axmA3RUn
	PnzkQuzBxqnC2v7wAPEYgVMvQME/1hS06eai0ga51su5nb1b5Hl1e825DTiYgtdG
	lwjYPuHgTHF/Uab7cjk5fAnQHB42VyOkawelWgwhJ/xEuIrSc1dD4uTYdETA5bLW
	KtUblTCQcOvcbXn+6OxaGstbu4c2PsHQxxpo/eme/Q2TsfyHyoorezeCeSpDSvo+
	9h57HEirw1nD9kPjzeLKkaIbFFimGwwEv5Iie7KRLclKqD+kJRpNY9xXu4cVHvH1
	OSi4T/8jqZ+Hre3ZZDGcA==
X-ME-Sender: <xms:YFhzY80sKBaYru5SniQVG24mje2LrrtljqDWPvaXw1uP7M0XAKsgaw>
    <xme:YFhzY3FdTeLs3W7AlYlR8qpL8qJqx2IhCuex5BvoMyKO2tWLbpccTT-zUlyBNNQHt
    8PBRRjU2ApdzZlDE_4>
X-ME-Received: <xmr:YFhzY06ncPad7SneNYcM-rneufVNp3GPub4jfJUXGoDck-ZFeSAGv_nsy7-lxLLtDERm_7VaB6NWgTrg2h0uqV94br2aaomPQsTNyD3nrBEiaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
    gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YFhzY128EkmJafzfcvlr1zpi0iifvP8VCAfLHHts4XS0CrbWBeH7tA>
    <xmx:YFhzY_GFNXqzNYUHhe_inWhgZbcBOerBwrDAsjqRRc8bde8CmxS9Zw>
    <xmx:YFhzY-8pMxiqK_YnlMLXJwH13l-xT5VJ8sU5UaW5fHD6SJDhaZj2eg>
    <xmx:YlhzY2hHG5TBRfuardZKwGIc6-wiucZtoe0-iPUQjb6g0VogjUOrg-qfTv0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 04:14:08 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Karol Herbst <kherbst@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>, Lyude Paul <lyude@redhat.com>
Cc: Dom Cobley <dom@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Noralf Tr��nnes <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v9-1-24b168e5bcd5@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v9-0-24b168e5bcd5@cerno.tech>
 <20220728-rpi-analog-tv-properties-v9-1-24b168e5bcd5@cerno.tech>
Subject: Re: (subset) [PATCH v9 01/25] docs/fb: Document current named modes
Message-Id: <166850356807.1237314.1594865740292225715.b4-ty@cerno.tech>
Date: Tue, 15 Nov 2022 10:12:48 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1

On Mon, 14 Nov 2022 14:00:20 +0100, Maxime Ripard wrote:
> KMS supports a number of named modes already, but it's never been
> documented anywhere, let's fix that.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
