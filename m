Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA71F193F
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Dec 2024 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774100; cv=none; b=Mc6O4R2aiOf8Hr3uTymoSc1ySSM1m2VkLUelyjfgmClZIn2/qXepHlf1BcTuni43A2w8bUAOLmOQCaiXzAl3opwZmDLJF68HW1ojLmMH6xMREN+F66jIRIsIQk5rbTWRM7mM7EqUjE6xNlmt7lJdLt4KioVdH8WvHXtMqppyQsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774100; c=relaxed/simple;
	bh=JX/AW1kyX2XXAwOvMxFE5Laci7y84AYqsLp0yEgnHpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K3mEb+uTzyextFKWuqwGiEoT8gJTZBHq20nxxy7jKEW89m4X9BQl2SESUajZAuNKb8Hm6BsZo410AMNvh0DnWZzzIzV86y82TcdKa530h0d8oszVMr/YaK/LWSnb5qvyRdtZRxEIaP+6FHgPo6eFsvJYCGfPhmMiqRQp8BgbNlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=mzBK2w6E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S77unIHX; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="mzBK2w6E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S77unIHX"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5BA5B1140142;
	Sat, 21 Dec 2024 04:41:37 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sat, 21 Dec 2024 04:41:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1734774097; x=1734860497; bh=AcxmUTsfXk
	KeKsl0CZ2NpDh5y41XhobIptv8qZ6IPU4=; b=mzBK2w6EmrAbm/6U9+J3RpP6Z+
	U7wYPrD5JypyWOvFRAk5Tav+o5Bp9JiB4pudKisll7luVQI4F5qIhg15n/pGF+th
	5FPY1MUQqh5kaaRrRoFWFZvuld30Q2Zm27iKY1adTZJdZ9yd5HGlJb9mxawF8xhW
	q0s6pz3hSk3/TaAJggEA2f4qoYCB/JIPtKM8TT0kqcV5M4VBOgeaTB1WKsAHLo0N
	Y5lc/ZMLObQ2Qrd8M4O0tbVnkGB72ZLT9RoTwZklwsRK2lV8oe+VuaDq4kWyL0yh
	xmPrG/by2UCPKNwJr4crm5u1H2tzaGhr8ZeYjrNRvlpQWVqQA8HdUTQ2+8Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1734774097; x=1734860497; bh=AcxmUTsfXkKeKsl0CZ2NpDh5y41XhobIptv
	8qZ6IPU4=; b=S77unIHXAKmNkN2mOo8Kjlqo+t27eihwubjN+HoQZUwEcZZcijF
	dDjtu1+y6+sULW3SeusSLu8LmmQP+Tyh7DJZu7245zoXme4NZ1wSew9zwXCj/u3g
	xErkQ5m/nwkZyZhrkG/TX2AQ4J5fBxPi+iTlCJKYva3HLRxguywAr1VZfDOyGQSQ
	0qZgQQgldOqAi5yMlL/XVKwuq1SCqBgH62UaRjtQIcE5Ve+3l7o7Rg5ysWxk7DxA
	CIUkYiALqB7VgqQUlNCGQgg7bm0eYslmCturHyVt2cb5c+YmXeGqoGsoASCa/t7q
	unBp5fUE6kbts9gt9bofVdKNlVR21u+6xdA==
X-ME-Sender: <xms:UI1mZ4B-LzCF0adLk7MyVuHDN4bs_2JLCh2lr_-CB19yLCJVinWC2w>
    <xme:UI1mZ6j41RVEi4JYOjpIEUwhOOosQrIMoCFnW5gzgLGudvywTMPw8oZ6bF7IxWoqy
    4iavlFfbrs2Io7CbA>
X-ME-Received: <xmr:UI1mZ7knwmsyFkvoHGv5eNOioMdgHi1-FoxwLWa_EuLSWCg7vwYyEC8wVN3w4LRyzq9Zf09mdbBj6eErM-7m7vBxOueLHSs2vprOhY3w_hIv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrshhtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeduvdeuudeugedtueffteevveegheehvdfhfeduudev
    kefggfeftdehgeethffhffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthht
    ohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlghhirhgufihoohguse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrih
    esshhushgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgtphht
    thhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhope
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhugidqshho
    uhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrh
    hmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:UI1mZ-yLyqLih0pYu_LNYw95o4qznM6mFSYmsA8akjSY6iZITGzh2A>
    <xmx:UI1mZ9RfxyuWlLRh04y4NI_zHocotrmP2GlTWvWY4I32gKZ7p3aVFw>
    <xmx:UI1mZ5bhUnToplY64trLt3cxdgO6Pufd2Bc7xpvR5QuJq1ZW3YQvOQ>
    <xmx:UI1mZ2Ri3HrqAgU7p9pO5HljChKr2QLbforBtE2py8cOVpznnbqRnQ>
    <xmx:UY1mZzAhfmbhDlnIZlpcwSAGA2dJOkuE9t1rmXkZD8lpXLRAzJR2ZJqJ>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Dec 2024 04:41:32 -0500 (EST)
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
Subject: [PATCH 0/3] ASoC: sun4i-codec: add headphone dectection for Anbernic RG35XX devices
Date: Sat, 21 Dec 2024 22:26:31 +1300
Message-ID: <20241221094122.27325-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for headphone detection on the Anbernic RG35XX series. 

This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.

Thanks to Chris Morgan for his assistance putting this series together.

Regards,

Ryan

Chris Morgan (3):
  ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
  ASoC: sun4i-codec: support hp-det-gpios property
  arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX

 .../sound/allwinner,sun4i-a10-codec.yaml      |  6 ++
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |  5 +-
 sound/soc/sunxi/sun4i-codec.c                 | 59 ++++++++++++++++++-
 3 files changed, 67 insertions(+), 3 deletions(-)

-- 
2.47.1

