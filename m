Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5D717EA
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jun 2023 05:07:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1685941634; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ef3YQXUTCCUky/+9Vgz36O+vDejufiYKHzNQtFtPVbEOl4b5hf9xaz03P201DBt7bbNpytIQHde8BEaC1mEV/ysyoOkNaO8smLvU0eb8nozXNHdqVfHnGcsAVMzOsFiRXLm9mkJeB+yYagcow/Yhq2Gp56c65I4DKy2xxWU5uQM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685941634; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=mtqmSmkN680wxofzvKyt96HeMfZpmbLlWDEVH9p/l6c=; 
	b=Il06EhZqslMHF7kjpnp24rsJes9Qv4MvADf+CYRSue7vMeARWMl7GeA64XY0r8Q2qv+DtQZQpaxHJp9ndsSo4VS3t1z5L6FMG+0ozyexZWo/3xBF0du4uT7fFlv1rx72c4UjY16ZpLQq8v9UfUiFk1jNBp1vByC5I0J8mDTTL+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685941634;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=mtqmSmkN680wxofzvKyt96HeMfZpmbLlWDEVH9p/l6c=;
	b=cYGZeAjbL60fjhyCggB3UrBFYF9URenzQjLagEnWuWD0pLIMJybVCkSbsbmntvJh
	W/QkcoCEiTy0f+WE7h8BbDcUw0ajEKis2xsQHagDiSUdVK2pmtSkNL+p62cZuTyZVHj
	NxKLFWNDxltuW8CBsyztpK+aQjNgRe1Lige3OKtNyRAN5CNqDQXw+0g+8DxClqvjTXD
	Ckw3eiXvVeXFDcewOkSSXMusx+GxvZadEfO+rlU4is/D1qJ9kba5S3t+nmlknFOGgWM
	UzrLshVJnrCJ1Fzd4mFUdEcwMw+iwBjiyjnvez+FQiCxrcbwhQpOV/z9HPf0j92hXe+
	iaMPS8OXlg==
Received: from edelgard.fodlan.icenowy.me (120.85.99.123 [120.85.99.123]) by mx.zohomail.com
	with SMTPS id 1685941633293999.8809801748088; Sun, 4 Jun 2023 22:07:13 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rafael J Wysocki <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH RESEND] thermal/of: support thermal zones w/o trips subnode
Date: Mon,  5 Jun 2023 13:06:56 +0800
Message-Id: <20230605050656.479290-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Although the current device tree binding of thermal zones require the
trips subnode, the binding in kernel v5.15 does not require it, and many
device trees shipped with the kernel, for example,
allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, still
comply to the old binding and contain no trips subnode.

Allow the code to successfully register thermal zones w/o trips subnode
for DT binding compatibility now.

Furtherly, the inconsistency between DTs and bindings should be resolved
by either adding empty trips subnode or dropping the trips subnode
requirement.

Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
As I reading the history of
Documentation/devicetree/bindings/thermal/thermal-zones.yaml, I realized
that this seems to be some mess introduced in the process of converting
to DT schema. The initial conversion commmit, 1202a442a31f ("dt-bindings:
thermal: Add yaml bindings for thermal zones"), listed trips in the
required list. However, after the conversion, Maxime Ripard made commit
22fc857538c3 ("dt-bindings: thermal: Make trips node optional"), which
lifts the requirement of trips node, and in the message of this commit,
Maxime gived out an explaination. The final problem on the DT binding
end is at commit 8c596324232d ("dt-bindings: thermal: Fix missing
required property"), which "fixes" a "missing" required property that is
not really missing but intentionally removed. The problem is still
covered by the real code always being not requiring trips, until Daniel
Lezcano reworked the thermal_of handling code according to the DT
binding at the time the code refactoring happens, makes missing trips
subnode an error that will bail out the creation of the thermal zone,
and as the situation described in the commit message of Maxime that
thermal sensors must be bound to thermal zones exist, the thermal sensor
won't be correctly initialized, and even the thermal zones with trip
points that is bound to different subsensors of the same thermal sensor
edvice stop working. In the case of sun50i-a64, it leaves the whole
system out of thermal protection, because it's the main in-SoC thermal
sensor device that failed initialization.

Personally I agree with the opinion of Maxime, and think the trips node
requirement should be removed, so my suggestion for "resolving the
inconsistency" is just reverting the commit that re-adds trips submode
requirement.

However, as the binding w/o trips requirement has entered 5.15, which is
not only a stable release but also a LTS, how the DT-binding consistency
is resolved shouldn't affect merging this specific patch, because all
stable kernel's DT binding is what we need to support.

P.S. This resend is because of some mysterious reason that my mail
didn't enter linux-arm-kernel mailing list. I need some help for
properly sending patches to get linux-arm-kernel accepted. In addition I
added CC to Alexey Klimov because I saw a patch changing A64 DT to fix
the same issue fixing here.

 drivers/thermal/thermal_of.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 6fb14e521197..2c76df847e84 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -127,15 +127,17 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 	trips = of_get_child_by_name(np, "trips");
 	if (!trips) {
-		pr_err("Failed to find 'trips' node\n");
-		return ERR_PTR(-EINVAL);
+		pr_debug("Failed to find 'trips' node\n");
+		*ntrips = 0;
+		return NULL;
 	}
 
 	count = of_get_child_count(trips);
 	if (!count) {
-		pr_err("No trip point defined\n");
-		ret = -EINVAL;
-		goto out_of_node_put;
+		pr_debug("No trip point defined\n");
+		of_node_put(trips);
+		*ntrips = 0;
+		return NULL;
 	}
 
 	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
@@ -519,7 +521,10 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 	of_ops->bind = thermal_of_bind;
 	of_ops->unbind = thermal_of_unbind;
 
-	mask = GENMASK_ULL((ntrips) - 1, 0);
+	if (ntrips)
+		mask = GENMASK_ULL((ntrips) - 1, 0);
+	else
+		mask = 0;
 
 	tz = thermal_zone_device_register_with_trips(np->name, trips, ntrips,
 						     mask, data, of_ops, tzp,
-- 
2.39.1

