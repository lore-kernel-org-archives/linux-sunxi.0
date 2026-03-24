Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C073FBEA6;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370643; cv=none; b=sgxZVoyrOW0z7rSa0UkqcipnNHgM6QN0itHSLPEKIUZtj9izovb6G64Je6TaCS9/mlSB0vS4ebQiP3ZdNvxv/e1OnGGKx5/hisK6LHetqID0B+75yZjQIdXfhb6BWI7xlGfKFB61TvoV8e1mdr16eas+HkMTntAaBmVYmYFhznw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370643; c=relaxed/simple;
	bh=uALeBIQ9srGWNXN1FhxlvCEa7dBhMf1seaxU46RBbec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0yULse744i10Lxu89SDC4kkCCaGQgOypHfdPcB9nLdxucfcNrwFXgYyBn/1V4kRpplNDG2kZauzsFNR/YxMNjqjnrK+AGk53CX51ZLuRJSKpxtWh/4dG/rnBQUJacOdXPnY3AwHApwWXT8jA5sa+zIHVHzw0mGW9RGlRv2R7Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKd/bY+q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKd/bY+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC74CC19424;
	Tue, 24 Mar 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370642;
	bh=uALeBIQ9srGWNXN1FhxlvCEa7dBhMf1seaxU46RBbec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKd/bY+q7kW3h9G/0vdZWfPBXTRclabRpkl9UVKyk92HESgdxGDki/8TyS9AVIXCJ
	 lSAFfNUIYo0nb1xUWkEWeENwSkw+vi/RLWbD1x5nEN0XP8Wvem5ocAf6wnmBcH2IjT
	 ReiStKF/+/+YJoVFQ6eeDppiUnevBTLsre8qoW/au0niqzuAeOhvMcwwZWNm/OC1Jq
	 7KzdXf8Z6w27klffegiC+p5puoU4UuV2snqYUZoKaNPVPYDhh28rnBQDhr3wIp/5fU
	 MgkB8faRY+bseQU9CEOhRdGtC9GGqYITU5lRIDJf++OcKayqnrqicPm0S0oZi4ZY6a
	 XTxMlq7NVXEcA==
Received: by wens.tw (Postfix, from userid 1000)
	id 9FD5E5F9F8; Wed, 25 Mar 2026 00:44:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: sram: Document Allwinner H616 VE SRAM
Date: Wed, 25 Mar 2026 00:43:49 +0800
Message-ID: <20260324164357.1607247-2-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 has two switchable peripheral SRAM regions:

- The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
  to this region is enabled by default. CPU access can be disabled,
  after which reads will show the same stale value for all addresses,
  while writes are ignored.

  The mux value for this region is different from previous generations,
  and thus needs a completely new compatible.

- The SRAM C region is an alias of the first 128 KB of VE SRAM, plus 64
  KB of DE SRAM. The latter is otherwise unaccessible from the CPU. When
  CPU access is disabled, the whole region reads as zero, while writes
  are ignored.

  The mux value for this region is the same as on the A64 and H6. The
  existing compatible for the A64 already covers this.

Add the compatible for the VE SRAM to the list of covered compatibles in
the generic SRAM region binding.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..ddaab84f7ba0 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -81,6 +81,7 @@ patternProperties:
             - allwinner,sun4i-a10-sram-d
             - allwinner,sun9i-a80-smp-sram
             - allwinner,sun50i-a64-sram-c
+            - allwinner,sun50i-h616-ve-sram
             - amlogic,meson8-ao-arc-sram
             - amlogic,meson8b-ao-arc-sram
             - amlogic,meson8-smp-sram
-- 
2.47.3

