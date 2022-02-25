Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C523CE
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Feb 2022 17:15:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 20509580207;
	Fri, 25 Feb 2022 12:15:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 25 Feb 2022 12:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=ad+myDbTraiDib
	LD9Wd2binLWjCGhZXOo9yQK1aIxPM=; b=C9bY2w9vIj6SJHNekqsUNprIsj51NA
	AfQSrN75BFK4y7jQhlmIXIa72ok1NTLzUOnLaTlF8vdluiah5GdXDGueISnKLpjT
	NriIVDn04F7jdRNpiWQyNtOklIWj98bdb81MKVvcWzWcvnilElfL9MbA+MPXAqYL
	7doHd6P5GVtrKZMK2QQBzHz1hO4jShWqslS+SS5lK3brQ8CkC9DmCK/gdBLpyuu+
	8nreXk6NAzge6kHmtdOW9TospdyVxiQUmbizbSO/JHcRKrolIic+E7Z/B+wtykyB
	DlUwGlbbHdmLID5fMCqzq/4A8jGKoX9fEX7JB8RfJtUp9Y8JGjCG5v3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=ad+myDbTraiDibLD9Wd2binLWjCGhZXOo9yQK1aIx
	PM=; b=ItAkbYAQDEgz8sZWwT/LMrGx/FgQK4tUe3HFqRlI8I8gTJgGMYLDbsKkS
	mgWaseznmMZ+YXVhnvFw3utGfwSbmWTXOulUO7La2DZ+RJvyn+rc+eT7izzRLCSg
	aorlodduKo1J41mdaLRIkekV3lbWZqRkbv1gnU4aYSQqiBOtGG5u0AZEMjxdPn6h
	XpBVuWoR+Msnei8lG0D1Hk6984Ur7Hm0TjEXeAr/Gr1EHp6YDcQyd8jOXt5fV4vY
	rkHYYIIlMf14Bz0RDTnWcq/jrvcaUYEQvGFlEOq7eZZl8SSpNCuFRk434XvXyF3/
	j2uLfv9PIFOHLUd118WVy9dPKXfhw==
X-ME-Sender: <xms:nw4ZYmeHYxBiFyauELegiNYhTZzNf1Ajwu4ZfFzD0xJlY3kebkFyHg>
    <xme:nw4ZYgNN8dIxMqDLNj9Aur4yo5XtNI8X-1ZX-Ej8fq9018J7CeOqnw98kamxyDhxN
    N5DZCetv8_8flvBY2o>
X-ME-Received: <xmr:nw4ZYnjUEiyP0vjW_MH-stMLE-7DZsl39C9XOVezCh3DPmhZaIbNQo6WIG8YB7DGe7d4nsVVsUleObXDeJkXughExbh0R006WtqVYSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
    keeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nw4ZYj-za-LyemJQQBOLaXoqLN8nvCj_-jMLzEqbNRJsFWpAXWuyZg>
    <xmx:nw4ZYiuwPUdDmVUGD35yjfobn0EkcHMy6jHv1jdubgltPdbeotuwNQ>
    <xmx:nw4ZYqFAFfQlgNyqelWgS9Q-b5z74nCdlIr3G01QpphDHQgQiosKww>
    <xmx:oA4ZYjHnlYDG661p3pa6xKRPS3fReqa8h4t9Uo-8FVybtS0RScwT6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	Tim Gover <tim.gover@raspberrypi.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: Re: (subset) [PATCH v2 17/22] drm/sun4i: layer: Remove redundant zpos initialisation
Date: Fri, 25 Feb 2022 18:14:47 +0100
Message-Id: <164580928298.726994.16982977770024379725.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-18-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech> <20220221095918.18763-18-maxime@cerno.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Feb 2022 10:59:13 +0100, Maxime Ripard wrote:
> The sun4i KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in sun4i_backend_layer_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
