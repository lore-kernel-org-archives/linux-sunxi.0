Received: from m101-out-mua-6.websupport.se (m101-out-mua-6.websupport.se [109.235.175.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81A54499A2
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.235.175.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784569429; cv=none; b=osbv7yXZy2QL7nN0RB94C0+pmwhFduYhoiLNHeI1BzHsL0uwURv+XblXjUQkCurTAb1tujyosn7WsHDKNpi3e2t3xSqEjasSKKCRiJbd4CdRoVr8hA46TTZhhho/ouhKJffX8UDmobYGdClerrokQfLBscLwBrDGipzDuibOcsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784569429; c=relaxed/simple;
	bh=JsHQyksXAECz4hOT/t7xqDeBq0k7ZG3gkiPaX1orTi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EFOuxebj9IsYDygSfvjoT3ZJG3IWbSM32b5+WQnLCfw9tKTMNlEp3u/2XJvPz+uMg6Itsh4KOSXFu4zDa34QHhI9ObN2V4uK69aEqdr6HefMdgiy7pZWmfdbZmhbJ2y7bcKS7UmbdVDY3zt/CUi197XAFyzvBAgDDE0g2G29++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se; spf=pass smtp.mailfrom=palvencia.se; dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b=Fx7y2FWX; arc=none smtp.client-ip=109.235.175.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=palvencia.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b="Fx7y2FWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1784569422;
	bh=UiZDU+zwqlhCb8NClI+UcJBF+04owitay8cguXiw8Ww=;
	h=From:To:Cc:Subject:Date:From;
	b=Fx7y2FWXp9wedQG4Uc+Xp2zzHVj26clK2A+1nFgTlvacoscXIAAYiyHkSB00ofO71
	 4DxVq2gpAR9/G25wasUWTp1iDSufTZ2FFJLA5dTNEt12aEEVtUWdTNYRCKRo9y7kjM
	 z6buMjLsRYRqKqg9hzVs0h91bR9LVqjO+fRbjOn1+fdGBz0rc2hynLsy0VZDeGslC3
	 IOiMsr91ClFBdED0HlDp1FPNGQY03AeH3Yn+HuR2PIrNtt47YwctclKXNHZHrgq6Ft
	 c7QtnDr6oFT49IJzvtrZhdo6zIv8V366Y09KpjX6HYJEh9P3IzX74WztkbsDAnwmwp
	 eJGngRYH8vKmw==
Received: from m101-u5-ing.websupport.se (unknown [10.30.5.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4h3ntj6hkszSqf;
	Mon, 20 Jul 2026 19:43:41 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u5-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from palvencia.se (unknown [193.180.91.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u5-ing.websupport.se (Postfix) with ESMTPSA id 4h3nth2pbwz2wjk;
	Mon, 20 Jul 2026 19:43:40 +0200 (CEST)
From: Per Larsson <per@palvencia.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Per Larsson <per@palvencia.se>
Subject: [PATCH 1/2] arm64: dts: allwinner: a523: Add missing SPDIF pin
Date: Mon, 20 Jul 2026 19:42:42 +0200
Message-ID: <20260720174253.7686-1-per@palvencia.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Out-Spamd-Result: default: False [2.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_X_AS(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Out-Rspamd-Queue-Id: 4h3nth2pbwz2wjk
X-Out-Rspamd-Server: m101-rspamd-out-4
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1154
X-purgate-ID: 155908::1784569421-3D7071C6-B1A24F28/0/0

When spdif support was added for the Allwinner A523 family of SoCs, only
two of the three possible pins were added to the dtsi, since the third
would clash with the first ethernet port (emac0)
However, some devices don't use emac0 and instead use emac1 for the only
available ethernet port, leaving the pin free to use for spdif.

Add the missing pin to the dtsi so such devices can (later) use it

Signed-off-by: Per Larsson <per@palvencia.se>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..7370e8ed24ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -216,6 +216,13 @@ spdif_out_pb_pin: spdif-pb-pin {
 				allwinner,pinmux = <2>;
 			};
 
+			/omit-if-no-ref/
+			spdif_out_ph_pin: spdif-ph-pin {
+				pins = "PH7";
+				function = "spdif";
+				allwinner,pinmux = <4>;
+			};
+
 			/omit-if-no-ref/
 			spdif_out_pi_pin: spdif-pi-pin {
 				pins = "PI10";
-- 
2.48.1

