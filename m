Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635C3F8E0
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Feb 2024 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708782911; cv=none; b=kRiS2wstrvBL2HldWJZ91ld905CSU1kI+xJXrSuWDkh8Dim/Jd5624X3hI1FU4J3Cc4k8HgE3StPyoEbx001IHZ64x/lfxm4trjqLlh9xp398cKCjarKzeD11Y/VbPiqZ6fK4NmoLEafDe262/kDLjKjY5nI53OryLkcG9UciOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708782911; c=relaxed/simple;
	bh=ZdTOrLkg/qf7wFKH1nhH7OcmYSUdowUaRsJjf+n31IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ra2tfE5/5pxy3ruFH4RQlW4W74fARJ9CtrkcaD/yQcuonaNUutnsPC69HqkforuJGwTLBUW08klapvUiurDXHSDE7ZZWp80MIqC77N1g1SQ2Q0xZVDtj8uXHUZmtmTFn271JKta4sh3UtZsPBDArxxVsQxcU2JVtHt9pB70F+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=ghV2nPFV; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="ghV2nPFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1708782907; bh=ZdTOrLkg/qf7wFKH1nhH7OcmYSUdowUaRsJjf+n31IQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ghV2nPFVjKO14UGccN3rXpU5361OkGdsnlFc+EPQiEijflmKOSJvXVVnOWqERaLia
	 v8SBR8AvGUndbw/tLtwCjCu9YOR9GSD0/g/k87i40dulFob/BqRh9sn1Qv7W5KbhpD
	 rJArs/+k/ODf+1XKCMRUT/LMNlw7oWZswM53gSVk=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Ondrej Jirman <megi@xff.cz>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [RESEND PATCH v2 0/5] Add support for jack detection to codec present in A64 SoC
Date: Sat, 24 Feb 2024 14:54:53 +0100
Message-ID: <20240224135501.3822390-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megi@xff.cz>

This series adds support for jack detection to this codec. I used
and tested this on Pinephone. It works quite nicely. I tested it
against Android headset mic button resistor specification.

The patches are improved and debugged version of the original
ones from Arnaud Ferraris and Samuel Holland, imrpoved to better
handle headset button presses and with more robust plug-in/out
event debouncing.

Please take a look. :)

v2:
- use set_jack/get_jack_type
- get rid of some custom poking inside card internals to figure
  out what kind of jack port we should setup the codec for
- read jack-type from OF as suggested here: 
  https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-component.c#L288
- add DT bindings

Thank you very much,
	Ondřej Jirman

Arnaud Ferraris (2):
  ASoC: sun50i-codec-analog: Enable jack detection on startup
  ASoC: sun8i-codec: Implement jack and accessory detection

Ondrej Jirman (1):
  dt-bindings: sound: Add jack-type property to sun8i-a33-codec

Samuel Holland (2):
  ASoC: sun50i-codec-analog: Move suspend/resume to set_bias_level
  ASoC: sun8i-codec: Enable bus clock at STANDBY and higher bias

 .../sound/allwinner,sun8i-a33-codec.yaml      |   9 +
 sound/soc/sunxi/sun50i-codec-analog.c         |  73 +++-
 sound/soc/sunxi/sun8i-codec.c                 | 359 +++++++++++++++++-
 3 files changed, 421 insertions(+), 20 deletions(-)

-- 
2.43.0

