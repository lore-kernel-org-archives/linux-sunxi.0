Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640766;
	b=xTgqP+9AHaATB/vfBiUpWR+6SOWUqd/JlwJaxkWVdEs+OK550jF5ZLfS2sntYZXFwexE
	 4GpNtMsvkfcuRc1B98uH58cfiCIXBV08Rtsaoph+2uqHN74Q5piN22rPG1zB8F/HXZsEz
	 N+19f5KyiG44qKZ71cLcpKfyZhKXa6xBoJ6VjGTXOmTdhy7G8kNMej4CyLKCpibxY79A6
	 j81MdrmPyD587LzoLm1E15gjSQ/PdaNku/+VmOHWiN+uLF5kyEGTO6p67SyS2SyQCJdlZ
	 hdJJ93CloeEG1Kr8EgnfrrnWkngqcQQHUNukUKt+zoiMdDAYrS1eOy7UuPPov7OJDww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640766;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t4L7StXLpSuCzJ7HmqGw9DyrOWvhNC6AF3ZLL8DlrDo=;
	b=nf+Ht14lUCp/OXpeJ35EGjWG2hotmMqssuqicbsq1JmYmHp8CoghsHS5Wmskhx+NJNEM
	 3RhNce34mgGAQK90frl0vdVgnFwhZoSe12KKOFnkexb//5XmoEew5TDSOZWLYStrKVB3z
	 a+cGa1Br6O763L9HVz1WKPYzVNg8gsrw4j/N5UNn364MW57wQ5d+LiXwgXgMbh6wg+N1k
	 i1aXzxJGvJEsJD1Vt0kqBdiFpxYdRyQKgPrR2jb8ZIhv2lX8cPrkzS5YlCpk9DUxotN/3
	 od30PkP32W9ydU320EWwwX3QUi07IkLB0L2bA46x3MePesiYrLcuaFCXs7TEnvZSV3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=JRYgVPid;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B4E606A32D
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 21:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B4E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=JRYgVPid
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 3BBBC4C96B;
	Thu, 26 Nov 2026 08:05:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795640758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4L7StXLpSuCzJ7HmqGw9DyrOWvhNC6AF3ZLL8DlrDo=;
	b=JRYgVPidg63ejmLBt1/KYuC8Lk6HOUXOmieBIHkuWaIyM9OnqBn52d2hhhtdmbS+nJW7GL
	Pl40PF9gisyG+mIx6ZnHaCBHmv5gNHXyVjGIJuLFre5M4jITrEbLvhtiaWNQfx3aVgQWqt
	vY/t+XB1r49zKk81aUa5dnB8iAKDhJMhB8OB7P0Mwh6hxFU1W3kUPJNhQ+Q1jO4rrSqjb0
	2ps/cEuPPjwVGlvv4u5qauP430k4nMziE93SFMts4ieygNKfUZDWzUc1wR9H8RBPRBJQJV
	oeIleQjwBZ8ritfr3KqKTlfFANm56f6hLiew124p/4IxO8HdHYpvkOyiMauCGw==
X-GPT-Reason: This email is classified as legitimate, specifically
	a technical patch notification. The content is a specific hardware/software
	update ("Enable Crypto Engine") that directly aligns with the
	personal/professional mailbox of alastair@d-silva.org. The sender
	domain (d-silva.org) perfectly matches the recipient's domain
	and the signed-off identity, and there are no phishing indicators,
	urgency tactics, or suspicious links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Olivia Mackall <olivia@selenic.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 4/4] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable Crypto Engine
Date: Thu, 26 Nov 2026 08:05:32 +1100
Message-ID: <20261125210532.695823-5-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125210532.695823-1-alastair@d-silva.org>
References: <20261125210532.695823-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Crypto Engine TRNG on the Xunlong OrangePi 4 Pro.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index df70967264ed..f63fe124d108 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -27,6 +27,10 @@ memory@40000000 {
 	};
 };
 
+&ce {
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dldo1>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.53.0

