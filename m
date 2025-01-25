Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB503207A0A
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jan 2025 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737788749; cv=none; b=MuyPfalt92v4L0hc0c44TX1QpKgAyiXsz8Vrwoo931KO9uxpnOAqo/dXosMyMcWHII6TNaAJLLPTlmcGtqkSzPQLocLx7yUFKj96okmi/qFacbgRDyZURKRkcdvOR5ec79weCrSBeT5skrVzwKj4BAy7fnv3CQWDJFMJgGGmJvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737788749; c=relaxed/simple;
	bh=F56E7pnbOx9pn+P/kD6f9ZV2mWgW9zPD0jHyG4L1JMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COQfgDu1FNl5OVNkofk5gdeBV8U/jt5gXnvf/he2bb00G0FrlCe8kfVq8c2k+KeFLQugcHsvZP1lHz0OLoh+pfChcIQlXrE/H+mhdn/Mb2f6+QVtW0ZizV5ZyCy1C7Jx6lcgEl4ANTHeybg+58eR/h1cxRvTyh8BIFlyOf+tKqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=p4Q7DEp2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=p0hWQ6m1; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="p4Q7DEp2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="p0hWQ6m1"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 9E6D81140114;
	Sat, 25 Jan 2025 02:05:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 25 Jan 2025 02:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737788745; x=
	1737875145; bh=v+QB5oAaTd71HtR/hfa4+42MYQULAvj4CXOLQvU0AhE=; b=p
	4Q7DEp2m0ci9sGnZcssfEytvThRtk7s/9Wndjl2zS2IfDZUwAmresYORUn3jUdyl
	+g3ZmI8JsFtUaOBdBxbJjw4YOdGHw7aNZLGf4hB5jvfHgKzM6Fix9s17esxQfzHZ
	9p7Wa+8+ITkqSXe9Bfo0uubMM0lAqhN+vWNZxqBeSZdRYTqH9BjRP2wlzc9gvxJ1
	tavVFSS7FciLiLZRXW3zQjlr1XEpu+QZN7F9hHR5CMoOzrQivdxaVcZejJsU7R2P
	zg1Qr8TmasbpYR2N73sUJ131uJaI/hxZAfGro0cLR5ohicdtP2pasRfjwKt4TXxX
	dRlX26hb002t3de+u53Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737788745; x=1737875145; bh=v
	+QB5oAaTd71HtR/hfa4+42MYQULAvj4CXOLQvU0AhE=; b=p0hWQ6m1elopHi6Z1
	yxmwExmG0ou4W+seSd96PE4IgmnyBPOrVa9oW4OIMd+85Sd+34FNWWDfGfIXNRaj
	4q9OwFF4CslTo6YJ2obc5K6QYWVcKJ7C4GtoxIK/ycMLS1rmXEF21Y033tjZTF0C
	WCydRH6+Zp4lPJNDNzzEel2ME+zoObBT8FDiYt5+UWGKdLi7zVPZOSA0qP5KEyHo
	bAtCqCwf5cVMZkDhifcnoElSw5c6kSPvhK9qE+pXp3VWJHjTdv47FAs+sVGUCt4F
	HsOQbywq1yIC7vz+mPWoJ+3K6J9K/3G1gc4DRqG15tC8nbGUtsVSufOZhzqo9tyj
	oREjg==
X-ME-Sender: <xms:SY2UZxJ3egeqmoUl77CSrbhQOtZP5Qx_rEk5tymsOvRLYno5Es7NzQ>
    <xme:SY2UZ9L6rN6jVpXuy8t1enbf65mc9av4SMVXi2aSiEGVdsVvSRATiTJX3jbAsXl6D
    yzyLJzW_5TtnuqSIw>
X-ME-Received: <xmr:SY2UZ5vP94UO900pRjVelGLrb_SoByT9lR9aoWwM0kdJdHOCN6v53yhM95JKX0xDVo7_HGQVXjtjAdArteMgNem15asZW5En2uzGKLckG4zd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgieejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepjeevhedtjeeuvdeiteelgeehjeegieeuveev
    ffetffdvudevfefhudejiedvgfdunecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhigrnhes
    thgvshhtthhorghsthdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgi
    esphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghp
    thhtohepfigvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrh
    grsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishht
    shdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:SY2UZyYT0MBDM0IdaIEFSMhaFN-xspwDrgtUnoLsPYYKbjm_7XfYlg>
    <xmx:SY2UZ4YPGOGR_2adnDzQ8M0SBtODfbA3-jRg9bIAwy1vllQITE2mCg>
    <xmx:SY2UZ2Ccn3ndP1zN9yXEMzTR17dTe1H-3h4TYpN9bdbvux_KZI-Egg>
    <xmx:SY2UZ2ZmkQoyYIxUzLkgb-pUL1E58PffOV8YdYwEy1NfXa_Aa_Mp1A>
    <xmx:SY2UZ4qM7LIe01HJGOkdyHc2dEoAUGvhED07RkkwiZ0fPobjsusYifde>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Jan 2025 02:05:41 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 5/5] ASoC: sun4i-codec: change h616 card name
Date: Sat, 25 Jan 2025 20:00:15 +1300
Message-ID: <20250125070458.13822-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding jack detection requires sound servers to act on the emitted
events, which are described by ALSA Use Case Manager configurations in
userspace. These configurations include the card name in the file path,
so alter the card name for the H616 to remove spaces, making UCM
referencing easier. Add a long_name to maintain consistency with the
other drivers.

The corresponding ALSA UCM patch is here:
https://github.com/alsa-project/alsa-ucm-conf/pull/491

Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Separate patch for card->long_name
- Note UCM patch link
---
 sound/soc/sunxi/sun4i-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 3701f56c72756..68e2d82228a0b 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -2012,7 +2012,8 @@ static struct snd_soc_card *sun50i_h616_codec_create_card(struct device *dev)
 
 	card->dev		= dev;
 	card->owner		= THIS_MODULE;
-	card->name		= "H616 Audio Codec";
+	card->name		= "h616-audio-codec";
+	card->long_name		= "H616 Audio Codec";
 	card->driver_name	= "sun4i-codec";
 	card->controls		= sun50i_h616_card_controls;
 	card->num_controls	= ARRAY_SIZE(sun50i_h616_card_controls);
-- 
2.48.1

